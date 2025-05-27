*** Settings ***
Documentation     To validate login page
Library           SeleniumLibrary
Library           Collections
Test Setup        Open Chrome with the specified URL
Test Teardown     Wait for test execution to complete and Close BROWSER
Resource          ../TestResources/GenericResource.robot
Resource          ../PO/loginPage.robot
Resource          ../PO/shopPage.robot
Resource    ../PO/checkoutPage.robot
Library        ../CustomLibraries/ShopItems.py
Resource        ../PO/locationAndOrderConfirmationPage.robot

*** Variables ***

@{required_item}        Blackberry    Nokia Edge
${Location}             India

*** Test Cases ***    

Unsuccessful Login Test
    [Tags]        SMOKE  
    loginPage.Enter the credentials and interact with radio and checkboxes    ${Username}    ${Invalid_Password}
    loginPage.Wait until the error message is located              
    loginPage.Verify whether the message is correct or not

End to End shopping ecommerce test
    [Tags]        REGRESSION    
    loginPage.Enter the credentials and interact with radio and checkboxes   ${Username}    ${Valid_Password}   
    shopPage.Wait until the Shop page is displayed
    ShopItems.Add Items To Cart    ${required_item}
    # shopPage.Get Shop Data from WebPage and add items to Cart      ${required_item} 
    shopPage.Click the Checkout Button
    checkoutPage.Verify That Cart Data Matches Expected Data    ${required_item}
    checkoutPage.Proceed to Checkout
    locationAndOrderConfirmationPage.Enter the country in the Input field and place the order        ${Location}
    locationAndOrderConfirmationPage.Wait and Validate That the Success Message Is Displayed