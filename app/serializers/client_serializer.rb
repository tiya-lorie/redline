class ClientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
  has_many :projects
end
