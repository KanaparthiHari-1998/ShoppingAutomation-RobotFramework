*** Settings ***
Documentation        To create a REST API session and handling the requests
Library              RequestsLibrary


*** Variables ***
${data_url}        https://reqres.in
${end_point}       /api/users?page=2

*** Test Cases ***
Get the data from the provided API
    Create Session    mySession    ${data_url}
    ${response}    GET On Session    mySession    ${end_point}
    ${json_data}    Set Variable     ${response.json()}
    Log    ${json_data}
    ${user_data}    Set Variable    ${json_data}[data]
    Log    ${user_data}
    FOR    ${user}    IN    @{user_data}
        Log    ${user}[email]
        
    END
    Should Be Equal As Integers    ${response.status_code}    200

