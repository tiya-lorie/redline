class Client::Show < Trailblazer::Operation
  step :find

  def find(ctx, **)
    ctx[:model] = Client.find_by_id ctx[:params][:id]
  end
end
