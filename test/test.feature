Feature: Test page Oragne HRM

Background:

  * driver 'https://opensource-demo.orangehrmlive.com/web/index.php/auth/login'

  #* def session = { capabilities: { 'goog:chromeOptions': {  args: [ '--headless', '--disable-notifications','--disable-popup-blocking', '--start-maximized' ] }}}

   @regresion @login
    Scenario: Login user page Oragne HRM
      * call read('login.feature') logindata.success
      * waitForText('h6','Dashboard')
      * screenshot()

   @regresion @login-input-empy
    Scenario: Login user inputs required page Oragne HRM
      * call read('login.feature') logindata.empy_form
      * def validateInputsRequired = locateAll('span','Required')
      * match validateInputsRequired.length == 2
      * screenshot()

    @regresion @login-invalid-credencial
    Scenario: Login user invalid credencial page Oragne HRM
      * call read('login.feature') logindata.bad_credenciales
      * waitForText('p','Invalid credentials')
      * screenshot()

    @regresion @add-new-user
    Scenario: Admin add new user page Oragne HRM
      * call read('login.feature') logindata.success
      * waitForText('h6','Dashboard')
      * call read('dashboard.feature') dashboardData.new_user
      * screenshot()
