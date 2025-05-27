*** Settings ***
Documentation        To Validate the Login Page
Resource             ../Utilities/GenericResource.robot
Library              ../CustomLibraries/CredentialGetter.py

*** Variables ***
${Input_Username_Locator}        xpath://input[@name='username']
${Input_Password_Locator}        xpath://input[@name='password']
${Login_button}                  css:button[type='submit']
${Valid_Username_Locator}        xpath://p[contains(@class, 'oxd-text') and text()='Username : Admin']
${Valid_Password_Locator}        xpath://p[contains(@class, 'oxd-text') and text()= 'Password : admin123']
${Invalid_Password}        2edw3456
${Invalid_Username}        harikumar


*** Keywords ***

Login with Valid Credentials
    # ${username}=    Get Credentials From Login Page    ${Valid_Username_Locator}
    # ${password}=    Get Credentials From Login Page    ${Valid_Password_Locator}
    ${username}=    Get Credentials from login page using KDD    ${Valid_Username_Locator}
    ${password}=    Get Credentials from login page using KDD    ${Valid_Password_Locator}
    Input Text    ${Input_Username_Locator}    ${username}
    Input Text    ${Input_Password_Locator}    ${password}
    Validate Password Masking
    Click Button    ${Login_button}       

Login with invalid Credentials
    Input Text    ${Input_Username_Locator}    ${Invalid_Username}
    Input Password    ${Input_Password_Locator}    ${Invalid_Password}
    Validate Password Masking
    Click Button    ${Login_button}  
    

Login with Empty Credentials 
    Click Button    ${Login_button}

Validate Password Masking
    ${password_type}=    Get Element Attribute    ${Input_Password_Locator}    type
    Should Be Equal As Strings    ${password_type}    password