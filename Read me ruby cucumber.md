# Ruby with Appium: Tutorial to Run Your First Test on LambdaTest

## Objective
By the end of this topic, you will be able to:

1. Run a sample automation script of Ruby for application testing with Appium on LambdaTest.

2. Learn more about Desired capabilities for Appium testing.

## Pre-requisites

---

- You will need a LambdaTest username and access key. To obtain your access credentials, purchase a plan or access the [automation dashboard](https://appautomation.lambdatest.com/).

- Ensure you have Appium’s Ruby console library installed. If not installed, you can install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) from here.

- Ensure you have Dependency manager ‘bundler’ installed. If not installed, you can install with the following command  - 
```
‘gem install bundler’.
```

- Access to an Android app (.apk or .aab file) or an iOS app (.ipa file)
Note: If you do not have an .apk or .ipa file and are looking to simply try App Automate, you can download and test using our [sample Android app](https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_android.apk) or [sample iOS app](https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_ios.ipa).


### Run your first test 

**Step-1:** Upload your Application
1.1 You need to generate Basic Auth (BASE64) Token with your LambdaTest UserName & Access Key [Basic Authentication](https://mixedanalytics.com/knowledge-base/api-connector-encode-credentials-to-base-64/).

1.1.1 Enter your “Username:AccessKey” and click on Base64 Encode.

1.1.2 A basic authentication token will be generated. Copy the token.

1.2 Use the following cURL command with your basic auth token in cmd/Terminal

```
curl -u "Username :Basic <ENTER_BASIC_AUTH_TOKEN_HERE>" 
-X POST "https://manual-api.lambdatest.com/app/upload/realDevice" 
-F "appFile=@"/path/to/file""
If the basic auth token generated is  “abcd1234efgh5678“ and the app file path is “D:\proverbial.apk”, then the following cURL command needs to be used to upload your application:
```

```
curl -u "lambda1:abcd1234efgh5678" 
-X POST "https://manual-api.lambdatest.com/app/upload/realDevice" 
-F "appFile=@"D:\proverbial.apk""
Response of above curl will be an app URL in the below format and will be used in the next step. <lt://APP10020521645697262525590>
```

**Step-2:** Write your automation script


2.1 Write your automation script in the client language of your choice from the ones supported by Appium. Write the automation script is a bit different as compared to other languages. Here are different files for environment variables, hooks, script, etc.  An automation script for the sample applications have been provided below. The sample directory is provided in github.

#### Android Sample

Here is the config file which provides access capabilities and browser capabilities:

```
server: "beta-hub.lambdatest.com"

common_caps:
  "user": "lambda1"
  "accessKey": "abcd1234efgh5678"
  "project": "First Cucumber Android Project"
  "build": "build-1"
  

browser_caps:
  -
    "platformName": "Android"
    "platformVersion": "9"
    "deviceName": "Galaxy S8 Plus"
    "app": "lt://APP100201841649152906228148"
    "name": "first_test"
    "isRealMobile": "true"

```


The file first_steps.rb defines the script that the test should follow:

```
When /^I try to Click on color using proverbial_android App/ do
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/color").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/color").click
end

When /^I try to Click on Text using proverbial_android App/ do
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/Text").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/Text").click
end

When /^I try to Click on toast using proverbial_android App/ do
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/toast").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/toast").click
end

When /^I try to Click on Notification using proverbial_android App/ do
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/notification").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/notification").click
  sleep 5
end

When /^I try to Click on geoLocation using proverbial_android App/ do
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/geoLocation").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/geoLocation").click
  sleep 5
  $driver.back
end

When /^I try to Click on speedTest using proverbial_android App/ do
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/speedTest").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/speedTest").click
  sleep 5
  $driver.back
end

When /^I try to Click on Browser using proverbial_android App/ do
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/Browser").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/Browser").click
end

When /^I try to Click on url using proverbial_android App/ do
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/url").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/url").click
end

When("I type in {string}") do |search_keyword|
  $wait.until { $driver.find_element(:id, "com.lambdatest.proverbial:id/url").displayed? }
  search_box = $driver.find_element(:id, "com.lambdatest.proverbial:id/url")
  search_box.send_key(search_keyword)
  $wait.until {$driver.find_element(:id, "com.lambdatest.proverbial:id/find").displayed?}
  $driver.find_element(:id, "com.lambdatest.proverbial:id/find").click
  sleep 5
end

Then /^I should see results$/ do
  $driver.find_elements(:class, "android.widget.TextView").size.should > 0
end

```

The env.rb defines the environment variables and desired capabilities:

```
require 'yaml'
require 'rspec'
require 'selenium-cucumber'
require 'pry'
require 'appium_lib'

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'first'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))
# binding.pry
caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])
caps['user'] = ENV['LT_USERNAME'] || caps['user']
caps['accessKey'] = ENV['LT_ACCESS_KEY'] || caps['accessKey']



cap = {
  "LT:Options" => caps
}



desired_caps = {
  caps: cap,
  appium_lib: {
    server_url: "http://#{CONFIG['server']}/wd/hub"
    
  }
}

begin
  $appium_driver = Appium::Driver.new(desired_caps, true)
  $driver = $appium_driver.start_driver
rescue Exception => e
  puts e.message
  Process.exit(0)
end

$wait = Selenium::WebDriver::Wait.new(:timeout => 30)
```

Hooks.rb basically closes the drivers:

```
After do
    $driver.quit if $driver
    if $bs_local
      $bs_local.stop
      $bs_local = nil
    end
  end
  
```
 

To run the script, first go to the directory and then run the command given below:

```
bundle exec rake first
 ```

##iOS Sample

Here is the config file which provides access capabilities and browser capabilities:

```
server: "beta-hub.lambdatest.com"

common_caps:
  "user": "lambda1"
  "accessKey": "abcd1234efgh5678"
  "project": "First Cucumber Android Project"
  "build": "build-1"
  

browser_caps:
  -
    "platformName": "iOS"
    "platformVersion": "12.0"
    "deviceName": "iPhone 8"
    "app": "lt://APP100202491650628350615433"
    "name": "first_test"
    "isRealMobile": "true"

```
The file first_steps.rb defines the script that the test should follow:

```
When /^I try to Click on color using proverbial_ios App/ do
  $wait.until {$driver.find_element(:accessibility_id, "color").displayed?}
  $driver.find_element(:accessibility_id, "color").click
end
When /^I try to Click on Text using proverbial_ios App/ do
  $wait.until {$driver.find_element(:accessibility_id, "Text").displayed?}
  $driver.find_element(:accessibility_id, "Text").click
end
When /^I try to Click on toast using proverbial_ios App/ do
  $wait.until {$driver.find_element(:accessibility_id, "toast").displayed?}
  $driver.find_element(:accessibility_id, "toast").click
end
When /^I try to Click on Notification using proverbial_ios App/ do
  $wait.until {$driver.find_element(:accessibility_id, "notification").displayed?}
  $driver.find_element(:accessibility_id, "notification").click
  sleep 5
end
When /^I try to Click on geoLocation using proverbial_ios App/ do
  $wait.until {$driver.find_element(:accessibility_id, "geoLocation").displayed?}
  $driver.find_element(:accessibility_id, "geoLocation").click
  sleep 5
  $driver.back
end
When /^I try to Click on speedTest using proverbial_ios App/ do
  $wait.until {$driver.find_element(:accessibility_id, "speedTest").displayed?}
  $driver.find_element(:accessibility_id, "speedTest").click
  sleep 5
  $driver.back
end
When /^I try to Click on Browser using proverbial_ios App/ do
  $wait.until {$driver.find_element(:accessibility_id, "Browser").displayed?}
  $driver.find_element(:accessibility_id, "Browser").click
end
When /^I try to Click on url using proverbial_ios App/ do
  $wait.until {$driver.find_element(:accessibility_id, "url").displayed?}
  $driver.find_element(:accessibility_id, "url").click
end
When("I type in {string}") do |search_keyword|
  $wait.until { $driver.find_element(:accessibility_id, "url").displayed? }
  search_box = $driver.find_element(:accessibility_id, "url")
  search_box.send_key(search_keyword)
  $wait.until {$driver.find_element(:accessibility_id, "find").displayed?}
  $driver.find_element(:accessibility_id, "find").click
  sleep 5
end

```

The env.rb defines the environment variables and desired capabilities:

```
require 'yaml'
require 'rspec'
require 'selenium-cucumber'
require 'pry'
require 'appium_lib'

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'first'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/#{CONFIG_NAME}.config.yml")))
# binding.pry
caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])
caps['user'] = ENV['LT_USERNAME'] || caps['user']
caps['accessKey'] = ENV['LT_ACCESS_KEY'] || caps['accessKey']



cap = {
  "LT:Options" => caps
}



desired_caps = {
  caps: cap,
  appium_lib: {
    server_url: "http://#{CONFIG['server']}/wd/hub"
    
  }
}

begin
  $appium_driver = Appium::Driver.new(desired_caps, true)
  $driver = $appium_driver.start_driver
rescue Exception => e
  puts e.message
  Process.exit(0)
end

$wait = Selenium::WebDriver::Wait.new(:timeout => 30)

```

Please refer to the link to select the Real Device and additional capabilities from the capability generator [Selenium Desired Capabilities](https://www.lambdatest.com/capabilities-generator/beta/index.html).

Hooks.rb basically closes the drivers:

```
After do
    $driver.quit if $driver
    if $bs_local
      $bs_local.stop
      $bs_local = nil
    end
  end

```



**Step-3:** Execute your test case
Open inside Android/ iOS folder and then go to examples.
Open examples in the terminal and run the following command:
```
bundle exec rake first
```

**Step-4:** View test execution
Once you have run your tests, you can view the test execution along with logs. You will be able to see the test cases passing or failing. You can view the same at [LambdaTest Automation](https://appautomation.lambdatest.com/build).



## Additional Capability Reference Guide
A more Detailed Capability Guide (PDF) is available [here](https://prod-mobile-artefacts.lambdatest.com/assets/docs/LambdaTest+App+Automation+Capability+Reference+Guide.pdf). 