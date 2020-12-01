class Project::Index < Trailblazer::Operation
  step :model!

  def model!(ctx, **)
    ctx[:model] = Project.all
  end
end
