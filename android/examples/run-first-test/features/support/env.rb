require 'yaml'
require 'rspec'
require 'selenium-cucumber'
require 'appium_lib'

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'first'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))

username = ENV["LT_USERNAME"] || "YOUR_LT_USERNAME"
accessToken = ENV["LT_ACCESS_KEY"] || "YOUR_LT_ACCESS_KEY"

caps = {     
    "lt:options" => {      
        :deviceName => "Galaxy S21 5G",
        :platformName => "Android",
        :platformVersion => "11",
        :build => "Ruby Cucumber - Android single",
        :name => "Ruby Android Test",
        :isRealMobile => true,
        :queueTimeout => 300,
        :app => "YOUR_ANDROID_APP_ID",
        :w3c => true,
        :autoGrantPermissions => true
    },
    :platformName => "Android"
}

appium_driver = Appium::Driver.new({
    'caps' => caps,
    'appium_lib' => {
        :server_url => "https://#{username}:#{accessToken}@mobile-hub.lambdatest.com/wd/hub"
    }
}, true)

begin
  $driver = appium_driver.start_driver
rescue => e
  puts "Error starting driver: #{e.message}"
  puts "Capabilities used: #{caps.inspect}"
  raise e
end


