*** Settings ***
Documentation     To Add Some Shop Items to cart
Library           SeleniumLibrary
Library           Collections
Resource          ../TestResources/GenericResource.robot

*** Variables ***
${Shop_Page_Validation}                     css:.nav-link
${shop_items}                               css:.card-title
@{List_Of_Items_From_Shop}                  Create List

*** Keywords ***

Wait until the Shop page is displayed
    GenericResource.Wait until the element in the locator is displayed    ${Shop_Page_Validation}    

Get Shop Data from WebPage and add items to Cart 
    [Arguments]    ${required_item}  
    @{required_items_list}    Create List    @{required_item}
    @{web_elements}    Get WebElements    ${shop_items}
    Log    ${web_elements}
    FOR    ${web_element}    IN    @{web_elements} 
        ${text}    Get Text    ${web_element}   
        Log    ${text}
        IF    "${text}" in ${required_items_list}
            Click Button    xpath://a[text()='${text}']/ancestor::div[contains(@class, 'card')]//button[contains(@class, 'btn-info')]
            Append To List    ${List_Of_Items_From_Shop}    ${text}
        END
        
        Log    ${List_Of_Items_From_Shop}        
    END

Click the Checkout Button  
    Click Link    css:.active .btn-primary  
    Sleep    3
    
    