class Base < Grape::API
  mount V1::Application
end
