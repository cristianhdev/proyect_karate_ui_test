Feature: login Page

    Scenario: login
      * clear(locatorsLoginPage.login.inputUserName)
      * input(locatorsLoginPage.login.inputUserName,username)
      * clear(locatorsLoginPage.login.inputPassord)
      * input(locatorsLoginPage.login.inputPassord,password)
      * click(locatorsLoginPage.login.btnSubmit)