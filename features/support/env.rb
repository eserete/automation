#encoding: UTF-8
 require 'capybara/cucumber'
 require 'capybara-screenshot/cucumber'
 require 'capybara/rspec'
 require 'capybara-screenshot/rspec'
 require 'selenium-webdriver'

    Capybara.register_driver :selenium_proxy do |app|
        #In this case selenium is using a proxy configuration with Chrome browser
        options = Selenium::WebDriver::Chrome::Options.new(args: ['start-maximized', 'spobrproxy.serasa.intranet:3128'])
        options.add_argument('--disable-geolocation')
        Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)
    end
    
    ###-----------------------------DEPRECATED CODE---------------------------------------###
    #                                                                                       #
    # Capybara.register_driver :selenium_proxy do |app|                                     #
    #    profile = Selenium::WebDriver::Chrome::Profile.new                                 #
    #    profile["network.proxy.type"] = 1                                                  #
    #    profile["network.proxy.http"] = "spobrproxy.serasa.intranet"                       #
    #    profile["network.proxy.http_port"] = 3128                                          #
    #    Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile => profile)      #
    # end                                                                                   #
    #                                                                                       #
    ###---------------------------END DEPRECATED CODE-------------------------------------###

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

    #Reset cache and cookies or quit browser After scenario's end
    After do |scenario|
        path = Capybara.save_path = "../GRP/features/support/screenshots"
        #Take a screenshot on failed scenario and quit browser session
        Capybara::Screenshot.register_driver(:selenium_proxy) do |driver, path|
            driver.save_screenshot(path) if scenario.failed?
        end   
    end
    