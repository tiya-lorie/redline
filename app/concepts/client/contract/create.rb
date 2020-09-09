class Client::Contract::Create < Reform::Form
  include Reform::Form::ActiveModel

  property :name, validates: { presence: true }
end
