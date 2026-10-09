Feature: dashboard Page

 Scenario:  add new user
      * click(locatorsDashboardPage.dashboard.btnAdmin)
      * click(locatorsDashboardPage.dashboard.btnAddUser)
      * input(locatorsDashboardPage.dashboard.inputEmployeeName,employeeName)
      * input(locatorsDashboardPage.dashboard.inputUserName,username)
      * input(locatorsDashboardPage.dashboard.inputPasswordNewUser,username)
      * input(locatorsDashboardPage.dashboard.inputPasswordConfirm,passwordcConfirm)