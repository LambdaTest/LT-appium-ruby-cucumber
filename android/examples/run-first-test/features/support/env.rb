require 'yaml'
require 'rspec'
require 'selenium-cucumber'
require 'appium_lib'

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'first'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))

@caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])

platform_name = ENV['PLATFORM_NAME'] ? ENV['PLATFORM_NAME'] : @caps["platformName"].inspect.gsub("\"", "")
is_real_mobile = ENV['IS_REAL_MOBILE'] ? ENV['IS_REAL_MOBILE'] : @caps["isRealMobile"].inspect.gsub("\"", "")
device_name = ENV['DEVICE_NAME'] ? ENV['DEVICE_NAME'] : @caps["deviceName"].inspect.gsub("\"", "")
platform_version = ENV['PLATFORM_VERSION'] ? ENV['PLATFORM_VERSION'] : @caps["platformVersion"].inspect.gsub("\"", "")
app = ENV['APP'] ? ENV['APP'] : @caps["app"].inspect.gsub("\"", "")

caps = {
  "LT:Options": {
    build: "Cucumber Android Single",
    name: "Cucumber Sample Test",
    w3c: true,
    platformName: platform_name,
    isRealMobile: is_real_mobile,
    deviceName: device_name,
    platformVersion: platform_version,
    app: app
  }
}

user = ENV['LT_USER'] ? ENV['LT_USER'] : CONFIG['user']
access = ENV['LT_ACCESS'] ? ENV['LT_ACCESS'] : CONFIG['key']
server = ENV['LT_SERVER'] ? ENV['LT_SERVER'] : CONFIG['server']

$appium_driver = Appium::Driver.new(
  {
    caps: caps,
    appium_lib: {
      server_url: "https://#{user}:#{access}@#{server}/wd/hub"
    }
  },
  true
)

begin
  puts caps
  $driver = $appium_driver.start_driver
ensure
  # $driver.driver_quit
end
