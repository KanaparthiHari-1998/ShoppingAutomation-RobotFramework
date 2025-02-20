*** Settings ***
Documentation        To validate the file download and upload using Robot Framework
Test Setup            Open the Browser using provided URL
Test Teardown         Once Test execution is completed Close the Browser
Resource             ../Utilities/genericData.robot

*** Variables ***


*** Test Cases ***
Validate the login page
    TRY
         FOR    ${element}    IN    @{LIST}
             Log    ${element}
             
         END
    EXCEPT    message
        
    END
    
    
