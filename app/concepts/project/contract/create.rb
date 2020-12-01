class Project::Contract::Create < Reform::Form
  include Reform::Form::ActiveModel

  property :name, validates: { presence: true }
  property :status, validates: { presence: true }
end
