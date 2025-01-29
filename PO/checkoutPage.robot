*** Settings ***
Documentation     To Verify items added to the card with the requirement and click on checkout
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${Cart_Items_Locator}        css:h4[class='media-heading']


*** Keywords ***
Verify That Cart Data Matches Expected Data
    [Arguments]        ${required_item} 
    @{returned_List_From_Cart}    Create List 
    Log    ${Cart_Items_Locator}
    @{List_Of_Items_From_Cart}    Get WebElements    ${Cart_Items_Locator}
    Log    ${List_Of_Items_From_Cart}

    FOR    ${element}    IN    @{List_Of_Items_From_Cart}
        ${text}    Get Text    ${element}
        Append To List    ${returned_List_From_Cart}    ${text}
    END

    Log    ${returned_List_From_Cart}
    Lists Should Be Equal    ${returned_List_From_Cart}    ${required_item}    ignore_order=True

Proceed to Checkout
    Click Button    css:.btn-success