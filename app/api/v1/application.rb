module V1
  class Application < Grape::API
    format :json
    prefix :api

    version :v1 do
      get("projects") { run!(Project::Index, request) }
      get("projects/:id") { run!(Project::Show, request) }
      post("projects") { run!(Project::Create, request) }

      get("clients/:id") { run!(Client::Show, request) }
      post("clients") {run!(Client::Create, request) }
    end

    helpers do
      def run!(operation_class, request)
        parser = Yajl::Parser.new(symbolize_keys: true)

        params = options[:method] == ["GET"] ? request.params : parser.parse(request.body.read)

        operation_class.(params: params, **options)[:model]
      end
    end
  end
end
