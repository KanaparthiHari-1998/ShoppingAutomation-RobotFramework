*** Settings ***
Documentation        To validate functionalities in the Orange HRM Dashboard
Library              SeleniumLibrary

*** Variables ***
${Quick_links_web_element_locator}          xpath://div[@class= 'oxd-grid-3 orangehrm-quick-launch']/div/button

*** Keywords ***
Verify quick launch links
    @{Quick_links}=    Get WebElements    ${Quick_links_web_element_locator}   
    FOR    ${element}    IN    @{Quick_links}
        ${item}=    Get Element Attribute    ${element}    title
        Click Element    xpath://button[@title='${item}']
        Wait Until Page Does Not Contain Element    ${Quick_links_web_element_locator}
        Set Selenium Implicit Wait    2s
        Go Back
        
    END  

    