*** Settings ***
Documentation        Setup and Tear down methods for Orange HRM application
Library    SeleniumLibrary
Library    String

*** Variables ***
${Url}        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${Browser}                Chrome
${Invalid_Credentials_Error_Message}        Invalid credentials


*** Keywords ***
Open the browser with the specified Url
    Open Browser    ${Url}    ${Browser}
    Maximize Browser Window

Wait for the test execution to complete and close the browser
    Close Browser

Get Credentials from login page using KDD
    [Arguments]        ${locator}
    ${all_Parts}    Get Text    ${locator}
    ${Split_Parts}=    Split String    ${all_Parts}
    ${Required_Credential}=    Strip String    ${Split_Parts}[-1]
    Log    ${Required_Credential}
    RETURN        ${Required_Credential} 

Wait until the element is located
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Log    ${locator}

Validate the error message
    [Arguments]    ${Error_message_locator}
    ${Error_Message}=    Get Text    ${Error_message_locator}
    Log    ${Error_Message}
    Should Be Equal As Strings    ${Error_Message}    ${Invalid_Credentials_Error_Message}

  
    