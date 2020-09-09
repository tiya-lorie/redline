Rails.application.routes.draw do
  default_url_options host: 'localhost'

  mount Base => '/'
end
