require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module AssetManager
  class Application < Rails::Application
    config.load_defaults 7.0

    # Uncomment the following line to enable sessions
    config.api_only = false

    # Uncomment the following line if you want to use cookies for sessions
    config.session_store :cookie_store, key: '_asset_manager_session'

    # Uncomment the following line if you want to use the database for sessions
    # config.session_store :active_record_store, :key => '_asset_manager_session'

    # Configuration for the application, engines, and railties goes here.
    # ...
  end
end
