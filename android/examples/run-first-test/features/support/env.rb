require 'yaml'
require 'rspec'
require 'selenium-cucumber'
require 'appium_lib'

# 1. Credentials from Environment or YAML
username = ENV['LT_USERNAME']
accessToken = ENV['LT_ACCESS_KEY']

# 2. Load YAML Config
config_path = File.join(File.dirname(__FILE__), "../../config/first.config.yml")
if File.exist?(config_path)
  config = YAML.load(File.read(config_path))
  common_caps = config['common_caps'] || {}
  browser_caps = config['browser_caps'][0] || {}
  # Merge them
  full_caps = common_caps.merge(browser_caps)
else
  full_caps = {}
end

# 3. Construct W3C Compliant Capabilities
caps = {
  "platformName" => full_caps["platform"] || "Android",
  "appium:deviceName" => full_caps["deviceName"] || "Galaxy S21 5G",
  "appium:platformVersion" => full_caps["platformVersion"] || "11",
  "appium:app" => "lt://proverbial-android", # Ensure this matches your LT app ID
  "appium:isRealMobile" => true,
  "appium:automationName" => "UiAutomator2",
  "lt:options" => {
    "user" => username,
    "accessKey" => accessToken,
    "build" => "Ruby-Cucumber-Android",
    "name" => "Sample Test",
    "w3c" => true,
    "isRealMobile" => true
  }
}

# 4. Initialize the Appium Driver
appium_lib_options = {
  server_url: "https://#{username}:#{accessToken}@mobile-hub.lambdatest.com/wd/hub",
  wait: 10
}

begin
  puts "Connecting to LambdaTest..."
  $appium_driver = Appium::Driver.new({ caps: caps, appium_lib: appium_lib_options }, true)
  $driver = $appium_driver.start_driver
  puts "Session started successfully!"
rescue Exception => e
  puts "Error starting driver: #{e.message}"
  raise e
end