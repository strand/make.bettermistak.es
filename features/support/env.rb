require 'capybara/cucumber'
Capybara.current_driver = :selenium
Capybara.app = "make sure this isn't nil" 
# Capybara.default_selector = :css

Capybara.configure do |config|
  config.run_server = false
  config.app_host = "http://make.bettermistak.es"
end