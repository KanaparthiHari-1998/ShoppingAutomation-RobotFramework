*** Settings ***
Documentation     To validate login page
Library           SeleniumLibrary
Library           Collections
Resource          ../TestResources/GenericResource.robot
*** Variables ***
${Location_page_Locator}        css:.input-field
${Location_List}                css:.suggestions
${Location_From_List}           xpath://div[@class='suggestions']/ul/li/a[text()='India']
${Success_Message}              css:.alert-success

*** Keywords ***
Wait until the location page is displayed
    GenericResource.Wait until the element in the locator is displayed        ${Location_page_Locator}

Enter the country in the Input field and place the order
    [Arguments]    ${country}
    Input Text    id:country    ${country}
    GenericResource.Wait until the element in the locator is displayed        ${Location_List}
    Click Element                ${Location_From_List}
    Click Element                xpath://label[@for='checkbox2']
    Click Element                css:.btn-success  

Wait and Validate That the Success Message Is Displayed 
    GenericResource.Wait until the element in the locator is displayed        ${Success_Message}
    Element Should Contain    ${Success_Message}    Success!
    
