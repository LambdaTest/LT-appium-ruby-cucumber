When /^I click on buttons app$/ do 
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  
  # Click on Color Button
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeButton[@name='color']") }
  element.click
  
  # Click on Geolocation Button
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeButton[@name='geoLocation']") }
  element.click
  
  # Wait for 5 seconds
  sleep(5)
  
  # Click back Button
  $driver.back
  
  # Click on Text Button
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeButton[@name='Text']") }
  element.click
  
  # Click on Notification Button
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeButton[@name='notification']") }
  element.click
  
  # Click on Toast Button
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeButton[@name='toast']") }
  element.click
  
  # Click on Speed Test Button
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeButton[@name='speedTest']") }
  element.click
  
  # Wait for 10 seconds
  sleep(10)
  
  # Go back
  $driver.back
  
  # Click on Browser Button
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeButton[@name='Browser']") }
  element.click
  
  sleep(5)
  
  # Enter URL
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeTextField[@name='url']") }
  element.click
  element.send_keys "https://www.lambdatest.com/"
  
  # Click Find Button
  element = wait.until { $driver.find_element(:xpath, "//XCUIElementTypeButton[@name='find']") }
  element.click
  
  sleep(5)
  $driver.back
  $driver.execute_script("lambda-status=passed")
end 

  
 

