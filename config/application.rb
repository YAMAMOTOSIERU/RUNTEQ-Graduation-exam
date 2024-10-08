# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'sprockets/railtie'
require 'action_cable/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.skip_routes true
      g.assets false
      g.helper false
      g.test_framework nil
    end
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'

    config.hosts << 'runteq-graduation-exam.onrender.com'
    config.hosts << 'rails-create-ymr-7e3d766e0d9c.herokuapp.com'
  end
end
