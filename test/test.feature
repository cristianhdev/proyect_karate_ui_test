Feature: Test page Oragne HRM

Background:

  #* driver baseUrl + '/web-form.html'


Scenario: test inputs
* focus('#my-text-id')
* input('#my-text-id',"test2")
* focus('input[name="my-password"]')
* match value('#my-text-id') contains "test2"
* input('input[name="my-password"]',"test1")
* match value('input[name="my-password"]') contains "test1"
* focus('textarea[name="my-textarea"]')
* input('textarea[name="my-textarea"]',"Lorent insup Lorent insup Lorent insup Lorent insup Lorent insup Lorent insup Lorent insup Lorent insup Lorent insup ")
* def countletters = value('textarea[name="my-textarea"]').length
* assert countletters > 10

@disabled
Scenario: disabled input
* def dsf = attribute('input[name="my-disabled"]','name')
* karate.log(dsf)
* match attribute('input[name="my-disabled"]','disabled') == 'true'

@Select_input
Scenario: selects
* select('select[name="my-select"]', 1)
* mouse('input[name="my-datalist"]').click()
* input('input[name="my-datalist"]','New York',100)
* mouse('{}New York').click()

@Select_file
Scenario: input file
* focus('input[type="file"]')
* input('input[type="file"]','document.pdf')

@check_box_radio
Scenario: input radio
* mouse('{}Default checkbox').click()
* def statecheck = script("document.querySelector('#my-check-1').checked")
* match statecheck == true
* mouse('{}Default radio').click()
* def filter = (el) => el.checked
* def radioButton = locateAll('input[type="radio"]',filter)
* karate.log(radioButton.length)

@color_picker
Scenario: color select picked
#* mouse("input[type='color']").click()
* value("input[type='color']","#00ff00")

@range_input
Scenario: range select picked
* value("input[type='range']",9)


@test_paginate
Scenario: range select picked
* driver baseUrl + '/navigation1.html'
* def itempage = ['1','2','3'] 
* def select =  function(item) { mouse('{a}'+item).click(); delay(500);waitForUrl('/navigation'+item)}
* itempage.forEach(select)

@mouse_events
Scenario: test mouse events
* driver baseUrl + '/dropdown-menu.html'
* highlightAll('#my-dropdown-1', 8000)
* mouse("#my-dropdown-1").click()
* delay(1000)
* mouse("{}Action").click()
* highlightAll('#my-dropdown-2', 8000)
* mouse("#my-dropdown-2").rightClick()
* delay(1000)
* mouse("{}Action").click()
* highlightAll('#my-dropdown-3', 8000)
* mouse("#my-dropdown-3").doubleClick()
* delay(1000)
* mouse("{}Action").click()

@drag_drop
Scenario: drag and drop test
* driver baseUrl + '/drag-and-drop.html'
* mouse("#draggable").down()
* mouse("#target").up()

@dialogs
Scenario: dialogs mouse events
* driver baseUrl + '/dialog-boxes.html'
* click('#my-alert')
* match driver.dialogText == 'Hello world!'
* dialog(true)
* click('#my-confirm')
* match driver.dialogText == 'Is this correct?'
* dialog(true)
* match text('#confirm-text') contains 'true'
* dialog(true, 'User input')
* click("#my-prompt")
* dialog(true,"test1")
* match text('#prompt-text') contains 'test1'
* click('#my-modal')
* click('{button}Close')