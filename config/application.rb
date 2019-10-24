require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IntSchool
  class Application < Rails::Application
    config.load_defaults 6.0
    config.api_only = true

    config.action_dispatch.return_only_media_type_on_content_type = false

    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*', headers: :any, methods: %i[get post options put patch delete]
    #   end
    # end

    # config.middleware.insert_before 0, "Rack::Cors" do
    #   allow do
    #     origins '*'
    #     resource '*', headers: :any, methods: [:get, :post, :options, :delete, :put, :patch], credentials: true
    #   end
    # end

    Bundler.require(*Rails.groups)
    Dotenv::Railtie.load if %w[development test].include? ENV['RAILS_ENV']

    initializer(
      :remove_action_mailbox_and_activestorage_routes,
      after: :add_routing_paths
    ) do |app|
      app.routes_reloader.paths.delete_if { |path| path =~ /activestorage/ }
      app.routes_reloader.paths.delete_if { |path| path =~ /actionmailbox/ }
    end
  end
end
