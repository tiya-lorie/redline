class Client::Create < Trailblazer::Operation
  step Model( Client, :new )
  step Contract::Build( constant: Client::Contract::Create, builder: :build! )
  step Contract::Validate()
  step :save

  def build!(ctx, constant:, **)
    client = Client.new(ctx[:params].select { |k, v| k == :name })
    ctx[:model] = constant.new(client)
  end

  def save(ctx, **)
    ctx[:model].save
  end
end
