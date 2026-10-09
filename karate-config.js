function fn() {
  var config = {
    driverConfig: {
      type: 'chrome',
      time:90000,
      headless:false,
      // Chrome command-line arguments
      addOptions: [
        '--incognito',
        '--disable-notifications',    // Block notification popups
        '--disable-popup-blocking',   // Allow popups (useful for OAuth flows)
        '--start-maximized'           // Open browser maximized
      ],
      // Chrome preferences (browser settings)
      prefs: {
        'download.default_directory': '/tmp/downloads'  // Set download folder
      }
    }
  };
  //Data
  config.dataLoginPath = './data/login.json';
  config.dataDasboardPath = './data/dashboard.json';

  //Config - data
  config.logindata = karate.read(config.dataLoginPath)
  config.dashboardData = karate.read(config.dataDasboardPath)


  //Locators
  config.loginLocators = './locators/page_login.json';
  config.dashboadLocators = './locators/page_dashboard.json';

  
  //Config - locators
  config.locatorsLoginPage = karate.read(config.loginLocators)
  config.locatorsDashboardPage = karate.read(config.dashboadLocators)

  
 

  // Apply driver config globally for all scenarios
  karate.configure('driver', config.driverConfig);
  return config;
}