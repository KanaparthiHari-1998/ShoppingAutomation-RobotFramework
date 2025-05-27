*** Settings ***
Documentation        To Automate the End to End Orange HRM application
Resource             ../Utilities/GenericResource.robot
Resource             ../PO/loginPage.robot
Resource             ../PO/dashboardpage.robot
Test Setup           Open the browser with the specified Url
Test Teardown        Wait for the test execution to complete and close the browser
 
*** Variables ***
${Input_Username_Locator}        xpath://input[@name='username']
${Invalid_Credentials_Error}     xpath://p[@class= 'oxd-text oxd-text--p oxd-alert-content-text']
${Dashboard_locator}             xpath://button[@class='oxd-icon-button orangehrm-quick-launch-icon']

*** Test Cases ***
Login with Invalid Credentials
    GenericResource.Wait until the element is located     ${Input_Username_Locator}
    loginPage.Login with invalid Credentials
    GenericResource.Wait until the element is located       ${Invalid_Credentials_Error}
    GenericResource.Validate the error message    ${Invalid_Credentials_Error} 
Login with Blank Credentials
    GenericResource.Wait until the element is located     ${Input_Username_Locator}
    loginPage.Login with Empty Credentials

End to End Automation Testing of Orange HRM
    GenericResource.Wait until the element is located     ${Input_Username_Locator}
    loginPage.Login with Valid Credentials
    GenericResource.Wait until the element is located     ${Dashboard_locator}
    dashboardpage.Verify quick launch links