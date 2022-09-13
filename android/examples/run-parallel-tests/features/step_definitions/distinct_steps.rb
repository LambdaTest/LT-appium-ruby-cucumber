When /^I click on buttons app$/ do 

  $driver.find_element(:id, "com.lambdatest.proverbial:id/color").click
  #Click on Color Button
  $driver.find_element(:id, "com.lambdatest.proverbial:id/color").click
  #Click on Geolocation Button
  $driver.find_element(:id, "com.lambdatest.proverbial:id/geoLocation").click
  #wait of 5 seconds
  sleep(5)
  #Click on back Button
  $driver.back
  #Click on text Button to enter value
  $driver.find_element(:id, "com.lambdatest.proverbial:id/Text").click
  #Click on Notification Button
  $driver.find_element(:id, "com.lambdatest.proverbial:id/notification").click
  #Click on toast Button      
  $driver.find_element(:id, "com.lambdatest.proverbial:id/toast").click
  #Click on speedtest Button      
  $driver.find_element(:id, "com.lambdatest.proverbial:id/speedTest").click
  #Wait for 10 seconds       
  sleep(10)
  $driver.back
  $driver.execute_script("lambda-status=passed")

end 

  
 

