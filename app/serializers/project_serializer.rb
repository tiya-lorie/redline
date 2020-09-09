class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :status, :client_id
  belongs_to :client
end
