class Project::Show < Trailblazer::Operation
  step :find

  def find(ctx, **)
    ctx[:model] = Project.find_by_id ctx[:params][:id]
  end
end
