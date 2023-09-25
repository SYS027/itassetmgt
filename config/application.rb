require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)
module AssetManager
  class Application < Rails::Application
    config.load_defaults 7.0

    # Enable sessions and cookies for the application
    config.api_only = false

    # Use the cookie_store for session management
    config.session_store :cookie_store, key: '_asset_manager_session'

    # CORS Configuration to allow requests from all origins
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://apps.itassetmgt.com'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end
    

    # Configuration for the application, engines, and railties goes here.
    # ...
  end
end

