#encoding: UTF-8
require 'capybara/cucumber'
# require 'capybara-screenshot/cucumber'
require 'capybara/rspec'
# require 'capybara-screenshot/rspec'
require 'selenium-webdriver'

Capybara.register_driver :selenium_proxy do |app|
  #In this case selenium is using a proxy configuration with Chrome browser
  options = Selenium::WebDriver::Chrome::Options.new(args: ['localhost:4444'])
  options.add_argument('--disable-geolocation')
  options.add_argument('--disable-gpu')
  options.add_argument('port=4444')
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)
end

#Start new driver with chosen browser
driver = Capybara.default_driver = :selenium_proxy

def close
  Capybara.current_session.driver.quit
end

def reset_session
  Capybara.reset_session!
end

Before do |scenario|
  close
  @driver = driver
end

# #Reset cache and cookies or quit browser After scenario's end
# After do |scenario|
#   path = Capybara.save_path = "../GRP/features/support/screenshots"
#   #Take a screenshot on failed scenario and quit browser session
#   Capybara::Screenshot.register_driver(:selenium_proxy) do |driver, path|
#     driver.save_screenshot(path) if scenario.failed?
#   end
# end
    