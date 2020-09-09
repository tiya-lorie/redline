class Project::Create < Trailblazer::Operation
  step Model( Client, :new )
  step :find_or_create_client!
  step Contract::Build( constant: Client::Contract::Create, builder: :build! )
  step Contract::Validate()
  step :save

  def create(ctx, **)
    ctx[:model] = Project.new(ctx[:params])
  end

  def build!(ctx, constant:, **)
    project = Project.new(ctx[:params])
    ctx[:model] = constant.new(project)
  end

  def save(ctx, **)
    ctx[:model].save
  end

  def find_or_create_client!(ctx, **)
    if ctx[:params][:client_id]
      client = Client.find_by_id(ctx[:params][:client_id])
      ctx[:client] = client.nil? ? Client::Create.(**ctx) : client
    else
      ctx[:client] = Client::Create.(**ctx)
    end
  end
end
