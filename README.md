# Cucumber With Appium

<p align="center">
<img height="500" src="https://user-images.githubusercontent.com/95698164/171858095-57a02573-3b2e-4dfb-92ee-5c62f1aade4d.png">
</p>

<p align="center">
  <a href="https://www.lambdatest.com/blog/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber" target="_bank">Blog</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.lambdatest.com/support/docs/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber" target="_bank">Docs</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.lambdatest.com/learning-hub/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber" target="_bank">Learning Hub</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.lambdatest.com/newsletter/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber" target="_bank">Newsletter</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.lambdatest.com/certifications/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber" target="_bank">Certifications</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.youtube.com/c/LambdaTest" target="_bank">YouTube</a>
</p>
&emsp;
&emsp;
&emsp;

*Cucumber is a free and open source behavior-driven development (BDD) tool that supports the development process. Its ordinary language parser, Gherkin, allows software behavior to be specified in a logical language that anyone can understand. Perform Appium automation tests on [LambdaTest's online cloud](https://www.lambdatest.com/appium-mobile-testing).*

*Learn the basics of [Appium testing on the LambdaTest platform.](https://www.lambdatest.com/support/docs/getting-started-with-appium-testing/)*

[<img height="53" width="200" src="https://user-images.githubusercontent.com/70570645/171866795-52c11b49-0728-4229-b073-4b704209ddde.png">](https://accounts.lambdatest.com/register)

## Table of Contents

* [Pre-requisites](#pre-requisites)
* [Run Your First Test](#run-your-first-test)
* [Executing The Tests](#executing-the-tests)

## Pre-requisites

Before you can start performing Ruby automation testing with Selenium, you would need to:

- Install **Ruby** and **gem** on your local system. Follow these instructions to install on different operating systems.

  - For **Windows**, you can download from the [official website](https://rubyinstaller.org/downloads/).
  - For **Linux** or **Ubuntu**, you can run a simple apt command like below:

    ```bash
    sudo apt-get install ruby-full
    ```

  - For **macOS**, you can run a [Homebrew](https://brew.sh/) command like this:

    ```bash
    brew install ruby
    ```

- Ensure you have Dependency manager **bundler** installed. If not installed, you can install with the following command -

  ```
  gem install bundler
  ```

### Clone The Sample Project

Clone the LambdaTest’s [LT_Ruby_Appium](https://github.com/LambdaTest/LT-appium-ruby-cucumber) and navigate to the code directory as shown below:

```bash
git clone https://github.com/LambdaTest/LT-appium-ruby-cucumber
cd LT-appium-ruby-cucumber
```

### Setting Up Your Authentication

Make sure you have your LambdaTest credentials with you to run test automation scripts on LambdaTest. To obtain your access credentials, [purchase a plan](https://billing.lambdatest.com/billing/plans) or access the [Automation Dashboard](https://appautomation.lambdatest.com/).

Set LambdaTest `Username` and `Access Key` in environment variables.

**For Linux/macOS:**

```js
export LT_USERNAME=YOUR_LAMBDATEST_USERNAME \
export LT_ACCESS_KEY=YOUR_LAMBDATEST_ACCESS_KEY
```
  
**For Windows:**

```js
set LT_USERNAME=YOUR_LAMBDATEST_USERNAME `
set LT_ACCESS_KEY=YOUR_LAMBDATEST_ACCESS_KEY
```
  
### Upload Your Application

Upload your **_iOS_** application (.ipa file) or **_android_** application (.apk file) to the LambdaTest servers using our **REST API**. You need to provide your **Username** and **AccessKey** in the format `Username:AccessKey` in the **cURL** command for authentication. Make sure to add the path of the **appFile** in the cURL request. Here is an example cURL request to upload your app using our REST API:

**Using App File:**

**For Linux/macOS:**

```js
curl -u "YOUR_LAMBDATEST_USERNAME:YOUR_LAMBDATEST_ACCESS_KEY" \
--location --request POST 'https://manual-api.lambdatest.com/app/upload/realDevice' \
--form 'name="Android_App"' \
--form 'appFile=@"/Users/macuser/Downloads/proverbial_android.apk"' 
```

**For Windows;**

```js
curl -u "YOUR_LAMBDATEST_USERNAME:YOUR_LAMBDATEST_ACCESS_KEY" -X POST "https://manual-api.lambdatest.com/app/upload/realDevice" -F "appFile=@"/Users/macuser/Downloads/proverbial_android.apk""
```

**Using App URL:**

**For Linux/macOS:**

```js
curl -u "YOUR_LAMBDATEST_USERNAME:YOUR_LAMBDATEST_ACCESS_KEY" \
--location --request POST 'https://manual-api.lambdatest.com/app/upload/realDevice' \
--form 'name="Android_App"' \
--form 'url="https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_android.apk"'
```

**For Windows:**

```js
curl -u "YOUR_LAMBDATEST_USERNAME:YOUR_LAMBDATEST_ACCESS_KEY" -X POST "https://manual-api.lambdatest.com/app/upload/realDevice" -d "{"url":"https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_android.apk","name":"sample.apk"}"
```

**Tip:**

- If you do not have any **.apk** or **.ipa** file, you can run your sample tests on LambdaTest by using our sample :link: [Android app](https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_android.apk) or sample :link: [iOS app](https://prod-mobile-artefacts.lambdatest.com/assets/docs/proverbial_ios.ipa).
- Response of above cURL will be a **JSON** object containing the `App URL` of the format - <lt://APP123456789123456789> and will be used in the next step.

## Run Your First Test

**Test Scenario:** Check out [first_steps.rb](https://github.com/LambdaTest/LT-appium-ruby-cucumber/blob/master/Android/examples/First_test/features/step_definitions/first_steps.rb) file to view the sample test script in android/ios folder and [first.config.yml](https://github.com/LambdaTest/LT-appium-ruby-cucumber/blob/master/iOS/examples/First_test/features/step_definitions/first_steps.rb) to make changes to the username, accessKey and app url.

### Configuring Your Test Capabilities

You can update your custom capabilities in test scripts. In this sample project, we are passing platform name, platform version, device name and app url (generated earlier) along with other capabilities like build name and test name via capabilities object. The capabilities object in the sample code are defined as:

<Tabs className="docs__val">

<TabItem value="android-config" label="Android" default>

**Android**

```ruby title="Android first.config.yml)"
server: "mobile-hub.lambdatest.com"
user: "LT_USERNAME"    # Add Lambdatest username here
key: "LT_ACCESS_KEY"   # Add Lambdtest accessKey here


common_caps:

  "build": "br-1"
  

browser_caps:
  -
    "isRealMobile": "true"
    "platform": "android"
    "deviceName": "Galaxy S21 5G"
    "platformVersion": "11"
    "app": "APP_URL"      # Add your app url here

```
**W3C Capabilities (Ruby 3.4 Fix)**

You must update your env.rb file (located in features/support/) using Symbols for keys.

Android Example:

```bash
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
```

</TabItem>
<TabItem value="ios-config" label="iOS" default>

**Ios**

```ruby title="iOS first.config.yml"
server: "mobile-hub.lambdatest.com"
user: "LT_USERNAME"    # Add Lambdatest username here
key: "LT_ACCESS_KEY"   # Add Lambdtest accessKey here

common_caps:

  "build": "br-2"
  

browser_caps:
  -
    "isRealMobile": "true"
    "platform": "ios"
    "deviceName": "iPad (2017)"
    "platformVersion": "13"
    "app": "APP_URL"      # Add your app url here

```
**W3C Capabilities (Ruby 3.4 Fix)**

You must update your env.rb file (located in features/support/) using Symbols for keys.

ios Example:
```bash
caps = {
  "platformName" => full_caps["platform"] || "ios",
  "appium:deviceName" => full_caps["deviceName"] || "iPhone 15",
  "appium:platformVersion" => full_caps["platformVersion"] || "17",
  "appium:app" => "lt://proverbial-ios", # Ensure this matches your LT app ID
  "appium:isRealMobile" => true,
  "appium:automationName" => "XCUITest",
  "lt:options" => {
    "user" => username,
    "accessKey" => accessToken,
    "build" => "Ruby-Cucumber-ios",
    "name" => "Sample Test",
    "w3c" => true,
    "isRealMobile" => true
  }
}
```
</TabItem>

</Tabs>

**Info Note:**

- You must add the generated **APP_URL** to the `"app"` capability in the config file.
- You can generate capabilities for your test requirements with the help of our inbuilt **[Capabilities Generator tool](https://www.lambdatest.com/capabilities-generator/beta/index.html)**. A more Detailed Capability Guide is available [here](https://www.lambdatest.com/support/docs/desired-capabilities-in-appium/).

## Executing The Tests

- Switch to `run_first_test` directory under [Android examples](android/examples) or [iOS examples](ios/examples)

- Go to `config/first.config.yml` and edit the username, acessKey and add your app url.

- Run the following commands to run your tests

```bash
bundle install
bundle exec rake first
```
Alternative command: If rake is not configured, you can run "bundle exec cucumber" directly in these folders.

### **Speed up test execution with parallel testing :**

- Switch to `run_parallel_test` directory under [Android examples](android/examples/) or [iOS examples](ios/examples/)


### **Use Local testing for apps that access resources hosted in development or testing environments :**

- Switch to `run_local_test` directory under [Android examples](android/examples/) or [iOS examples](ios/examples/)

**Info:** Your test results would be displayed on the test console (or command-line interface if you are using terminal/cmd) and on the :link: [LambdaTest App Automation Dashboard](https://appautomation.lambdatest.com/build).

## Troubleshooting

1. Error: Connection refused - connect(2) for "127.0.0.1"
Cause: Ruby is trying to find a local Appium server because it doesn't recognize your LambdaTest URL.
Fix: In your env.rb file, ensure the driver initialization uses symbols:

```bash
@appium_driver = Appium::Driver.new({
  :caps => caps,
  :appium_lib => { :server_url => server_url }
}, true)
```

## Additional Links

- [Advanced Configuration for Capabilities](https://www.lambdatest.com/support/docs/desired-capabilities-in-appium/)
- [How to test locally hosted apps](https://www.lambdatest.com/support/docs/testing-locally-hosted-pages/)
- [How to integrate LambdaTest with CI/CD](https://www.lambdatest.com/support/docs/integrations-with-ci-cd-tools/)

## Documentation & Resources :books:
      
Visit the following links to learn more about LambdaTest's features, setup and tutorials around test automation, mobile app testing, responsive testing, and manual testing.

* [LambdaTest Documentation](https://www.lambdatest.com/support/docs/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber)
* [LambdaTest Blog](https://www.lambdatest.com/blog/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber)
* [LambdaTest Learning Hub](https://www.lambdatest.com/learning-hub/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber)    

## LambdaTest Community :busts_in_silhouette:

The [LambdaTest Community](https://community.lambdatest.com/) allows people to interact with tech enthusiasts. Connect, ask questions, and learn from tech-savvy people. Discuss best practises in web development, testing, and DevOps with professionals from across the globe 🌎

## What's New At LambdaTest ❓

To stay updated with the latest features and product add-ons, visit [Changelog](https://changelog.lambdatest.com/) 
      
## About LambdaTest

[LambdaTest](https://www.lambdatest.com) is a leading test execution and orchestration platform that is fast, reliable, scalable, and secure. It allows users to run both manual and automated testing of web and mobile apps across 3000+ different browsers, operating systems, and real device combinations. Using LambdaTest, businesses can ensure quicker developer feedback and hence achieve faster go to market. Over 500 enterprises and 1 Million + users across 130+ countries rely on LambdaTest for their testing needs.    

### Features

* Run Selenium, Cypress, Puppeteer, Playwright, and Appium automation tests across 3000+ real desktop and mobile environments.
* Real-time cross browser testing on 3000+ environments.
* Test on Real device cloud
* Blazing fast test automation with HyperExecute
* Accelerate testing, shorten job times and get faster feedback on code changes with Test At Scale.
* Smart Visual Regression Testing on cloud
* 120+ third-party integrations with your favorite tool for CI/CD, Project Management, Codeless Automation, and more.
* Automated Screenshot testing across multiple browsers in a single click.
* Local testing of web and mobile apps.
* Online Accessibility Testing across 3000+ desktop and mobile browsers, browser versions, and operating systems.
* Geolocation testing of web and mobile apps across 53+ countries.
* LT Browser - for responsive testing across 50+ pre-installed mobile, tablets, desktop, and laptop viewports
    
[<img height="53" width="200" src="https://user-images.githubusercontent.com/70570645/171866795-52c11b49-0728-4229-b073-4b704209ddde.png">](https://accounts.lambdatest.com/register)
      
## We are here to help you :headphones:

* Got a query? we are available 24x7 to help. [Contact Us](support@lambdatest.com)
* For more info, visit - [LambdaTest](https://www.lambdatest.com/?utm_source=github&utm_medium=repo&utm_campaign=LT-appium-ruby-cucumber)
