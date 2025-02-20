*** Settings ***
Documentation     To validate login page
Library           SeleniumLibrary
Resource          ../TestResources/GenericResource.robot
Resource    ../Tests/handlingChildWindow.robot

*** Variables ***

${Logging_Error_Element_Validation}         css:.alert-danger

*** Keywords ***

Enter the credentials and interact with radio and checkboxes
    [Arguments]    ${Username}    ${Password}
    Input Text    id:username    ${Username}
    Input Password    id:password    ${Password}
    Select Radio Button    radio    user
    Wait Until Element Is Visible    css:.modal-body
    Click Button    css:.btn-success
    Wait Until Element Is Not Visible    css:.modal-body 
    Select From List By Value    css:select[class='form-control']    teach
    Select Checkbox    terms
    Click Button    id:signInBtn

Wait until the error message is located
    GenericResource.Wait until the element in the locator is displayed     ${Logging_Error_Element_Validation}

Verify whether the message is correct or not
    ${result} =    Get Text    ${Logging_Error_Element_Validation}
    Log    ${result}
    Should Be Equal As Strings    ${result}     Incorrect username/password.
