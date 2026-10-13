Feature: login Page

    Scenario: login
      * driver baseUrl + '/web/index.php/auth/login'
      * waitFor(LoginPage.login.inputUserName)
      * clear(LoginPage.login.inputUserName)
      * input(LoginPage.login.inputUserName,username)
      * waitFor(LoginPage.login.inputPassord)
      * clear(LoginPage.login.inputPassord)
      * input(LoginPage.login.inputPassord,password)
      * click(LoginPage.login.btnSubmit)
