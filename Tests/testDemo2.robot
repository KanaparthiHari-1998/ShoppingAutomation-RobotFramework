*** Settings ***
Documentation     To validate login page
Library           SeleniumLibrary
Library           Collections
Test Setup        Open Chrome with the specified URL
Test Teardown     Wait for test execution to complete and Close BROWSER
Resource          ../TestResources/GenericResource.robot

*** Variables ***
${Valid_Password}                           learning
${Invalid_Password}                         123456
${result}                                   ""
${Logging_Error_Element_Validation}         css:.alert-danger
${Shop_Page_Validation}                     css:.nav-link
${shop_items}                               css:.card-title
${required_item}                            Blackberry

*** Test Cases ***    

Unsuccessful Login Test    
    Enter the credentials and interact with radio and checkboxes    ${Username}    ${Invalid_Password}
    Wait until the element is displayed    ${Logging_Error_Element_Validation}
    Verify whether the message is correct or not

Successful Login Test
    Enter the credentials and interact with radio and checkboxes   ${Username}    ${Valid_Password}   
    Wait until the element is displayed    ${Shop_Page_Validation}
    Get Shop Data from WebPage and add an item to Cart    ${required_item}
    
*** Keywords ***

Enter the credentials and interact with radio and checkboxes
    [Arguments]    ${Username}    ${Password}
    Input Text    id:username    ${Username}
    Input Password    id:password    ${Password}
    Select Radio Button    radio    user
    Wait Until Element Is Visible    css:.modal-body
    Click Button    okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select[class='form-control']    teach
    Select Checkbox    terms
    Click Button    id:signInBtn

Wait until the element is displayed
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    timeout=10s

Verify whether the message is correct or not
    ${result} =    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}     Incorrect username/password.
    Element Text Should Be    css:.alert-danger    Incorrect username/password.

Get Shop Data from WebPage and add an item to Cart 
    [Tags]        SMOKE
    [Arguments]    ${required_item}  
    @{List_Of_Items_From_Shop}    Create List
    @{web_elements}    Get WebElements    ${shop_items}
    FOR    ${web_element}    IN    @{web_elements} 
        ${text}    Get Text    ${web_element}   
        IF    "${text}" == "${required_item}"
            Click Button    xpath://a[text()='${required_item}']/ancestor::div[contains(@class, 'card')]//button[contains(@class, 'btn-info')]
            BREAK
        END
        Append To List    ${List_Of_Items_From_Shop}    ${text}
        Log    ${List_Of_Items_From_Shop}        
    END
    