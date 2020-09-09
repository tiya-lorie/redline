require 'roar/json/json_api'

class ClientsRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :clients

  link :self, toplevel: true do
    "//clients"
  end

  attributes do
    property :name
  end

  link(:self, :dest) { "http://clients/#{represented.id}" }

  has_many :projects, class: Project, decorator: ProjectsRepresenter do
    attributes do
      property :name
      property :status
    end

    link(:self, :dest) { "http://projects/#{represented.id}" }
  end
end
