require 'yaml'
require 'rspec'
require 'selenium-cucumber'
require 'appium_lib'

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'parallel'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))

username = ENV["LT_USERNAME"] || "YOUR_LT_USERNAME"
accessToken = ENV["LT_ACCESS_KEY"] || "YOUR_LT_ACCESS_KEY"

caps = {     
    "lt:options" => {      
        :deviceName => "iPhone 14",
        :platformName => "iOS",
        :platformVersion => "16",
        :build => "Ruby Cucumber - iOS Parallel",
        :name => "Ruby iOS Parallel Test #{TASK_ID}",
        :isRealMobile => true,
        :queueTimeout => 300,
        :app => "YOUR_IOS_APP_ID",
        :w3c => true,
        :autoGrantPermissions => true
    },
    :platformName => "iOS"
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


