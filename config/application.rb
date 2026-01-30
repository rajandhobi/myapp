require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
 
module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1
    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.

  config.autoload_lib(ignore: %w[assets tasks])
config.active_job.queue_name_prefix = Rails.env
 config.active_job.queue_name_delimiter = "."
 config.autoload_paths << Rails.root.join("app/form_builders")
 config.autoload_paths << Rails.root.join("app/components")
 config.action_controller.wrap_parameters_by_default = false


# config/application.rb
config.active_storage.draw_routes = true

# Rails.application.config.session_store :cookie_store, key: "_your_app_session"
# Rails.application.config.session_store :cache_store
# Rails.application.config.session_store :cookie_store, key: "_your_app_session", domain: ".example.com"

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
