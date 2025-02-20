*** Settings ***
Documentation        To open and close the browser
Library    SeleniumLibrary

*** Variables ***
${URL}                https://rahulshettyacademy.com/
${Browser}            Chrome
${Username}           

*** Keywords ***

Open the Browser using provided URL
    Open Browser    ${URL}    ${Browser}


Once Test execution is completed Close the Browser
    Close Browser