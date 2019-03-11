ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'devise'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

def login_as(user)
  visit "/users/sign_in"
  fill_in "user[email]", with: user.email
  fill_in "user[password]", with: "password"
  click_on 'Se connecter'
end


CarrierWave.configure do |config|
  config.root              = Rails.root.join('spec/fixtures')
  config.cache_only        = true
  config.enable_processing = false
  config.base_path         = "/"
end


RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :system
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.append_after :each do |example|
    CarrierWave.clean_cached_files!(0)
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end


