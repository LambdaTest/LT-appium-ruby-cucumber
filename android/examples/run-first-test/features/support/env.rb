require 'yaml'
require 'rspec'
require 'selenium-cucumber'

require 'appium_lib'

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'first'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))

@caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])


#$bs_local = nil


puts @caps.inspect

us= @caps["user"].inspect
ak= @caps["key"].inspect
is= @caps["isRealMobile"].inspect
pl= @caps["platform"].inspect
dn= @caps["deviceName"].inspect 
pv= @caps["platformVersion"].inspect
ap= @caps["app"].inspect



user= us.gsub("\"", "")
accessKey=ak.gsub("\"", "")
isRealMobile= is.gsub("\"", "")
platform= pl.gsub("\"", "")
deviceName= dn.gsub("\"", "")
platformVersion= pv.gsub("\"", "")
app= ap.gsub("\"", "")
puts isRealMobile 


caps={ 
  
  "LT:Options" => {

    "build" => "Cucumber Android Single",
    "name" => "Cucumber Sample Test",
    "platformName" => platform,
    "isRealMobile" => isRealMobile,
    "deviceName" => deviceName,
    "platformVersion" => platformVersion,
    "app" => app,
    "w3c" => true

},

 
}


appium_driver = Appium::Driver.new({
      'caps' => caps,
      'appium_lib' => {
          :server_url => "https://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub"
          #server_url: "https://webhook.site/5958677a-4db9-4253-bb76-5b98e97e4880"
      }}, true)



begin
  #$appium_driver = Appium::Driver.new(desired_caps, true)
  $driver = appium_driver.start_driver
  #example.run
ensure
  #$driver.quit
end


