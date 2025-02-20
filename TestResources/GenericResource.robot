*** Settings ***
Documentation     Setup and teardown methods for the Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}                          https://rahulshettyacademy.com/loginpagePractise/
${Browser}                      Chrome
${Username}                     rahulshettyacademy
${Valid_Password}               learning
${Invalid_Password}             123456
    

*** Keywords ***
Open Chrome with the specified URL
    Open Browser    ${URL}    ${Browser} 
    Maximize Browser Window

Wait for test execution to complete and Close BROWSER
    Close Browser

Wait until the element in the locator is displayed
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s