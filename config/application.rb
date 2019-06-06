require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Astronight
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.action_mailer.delivery_method = :postmark
  config.action_mailer.postmark_settings = { :api_token => "7a11d051-b1b7-4dec-97ec-25ac923d1813" }
  end
end



Raven.configure do |config|
  config.dsn = 'https://0cef9081b9b54c30b1a8449f840a6506:12e18bc0fa2a48f2b678b5a8d5bd1c6e@sentry.io/1473436'
end

