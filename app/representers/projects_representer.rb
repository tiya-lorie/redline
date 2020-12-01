require 'roar/json/json_api'

class ProjectsRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :projects

  link :self, toplevel: true do
    "//projects"
  end

  attributes do
    property :name
    property :status
  end

  link(:self, :dest) { "http://clients/#{represented.id}" }
end
