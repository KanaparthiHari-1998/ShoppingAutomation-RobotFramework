*** Settings ***
Documentation        Handling the child window from testdemoRobot file
Library              SeleniumLibrary
Library              String
Library              Collections
Test Setup           Open Chrome with the specified URL
Test Teardown        Wait for sometime and Close Current BROWSER
Resource             ../TestResources/GenericResource.robot

*** Variables ***
${expected_text}        mentor@rahulshettyacademy.com
${actual_text}          ""

*** Test Cases ***
Validate the child window and grab the text from and use it in main window
    [Tags]        SMOKE
    Click on the blinking text 
    Verify the child window is opened or not 
    Grab the email id from the child window
    Switch to parent window and enter the text

*** Keywords ***

Click on the blinking text
    Click Element    xpath://div[@class='float-right']/a[1]
    Sleep            3    

Verify the child window is opened or not 
    Switch Window    New
    Wait Until Element Is Visible    css:.inner-box
    
Grab the email id from the child window
    ${text}=    Get Text    css:.im-para.red
    @{text_split}=    Split String     ${text}    ${SPACE}
    ${actual_text}=    Get From List    ${text_split}    4
    Set Test Variable    ${actual_text}
    Should Be Equal As Strings    ${actual_text}    ${expected_text}

Switch to parent window and enter the text
    Switch Window    main
    Wait Until Element Is Visible    login-box
    Input Text    username    ${actual_text}
    Sleep    3


