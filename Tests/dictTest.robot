*** Settings ***
Documentation    Sample program to understand Dictionary Data Handling
Library    Collections

*** Variables ***
&{PRODUCTS}    Laptop=[1000, 5]    Mouse=[20, 50]    Keyboard=[30, 20]
&{Emp_data}    Name=Hari    Age=26    Role=Software    Salary=35432
@{Test_list}    100    200    300    400    500
${Str1}    hari
${Str2}    kumar
${string}    Set Variable    HariKumar


*** Test Cases ***
Check the product data along with the Emp data
    ${full_str}    Catenate    SEPARATOR=    ${str1}    ${str2}
    Log    ${full_str}
    Log    ${string}
    Log    ${PRODUCTS}
    ${type}=    Evaluate    type(${Emp_data}).__name__
    Log    Type of Emp_data is: ${type}
    ${Temp_data}    Create Dictionary    'username'='hari1234'    'password'=1234555
    Log    ${Temp_data}
    ${Laptop_data}=    Get From Dictionary    ${PRODUCTS}    Laptop   
    Log    Laptop data: ${Laptop_data}
    Log    ${Emp_data}
    ${type}=    Evaluate    type(${Laptop_data}).__name__
    Log    Type of Laptop_data is: ${type}
    ${emp_name}=    Get From Dictionary    ${Emp_data}    Name
    Log    Employee name is: ${emp_name}
    Log    ${Test_list}
    ${list_items}    Get From List    ${Test_list}    1
    List Should Contain Value    ${Test_list}    300
    Append To List    ${Test_list}    304
    Log    ${Test_list}