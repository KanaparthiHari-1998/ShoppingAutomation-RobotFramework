
*** Settings ***
Documentation        To practice python based Robot programs
Library              String
Library              Collections
Library              ImageHorizonLibrary

*** Variables ***
${num}        8
${s}        "robot"
@{li}        10    25    5    30    40
${name}        "hari kanaparthi"
# ${unique_chars_in_name}    ""


*** Test Cases ***
Square and Cube of a number
    Square a number    ${num}
    Cube of a number    ${num}

Reversal and updating it to Uppercase
    Reversal of string    ${s}
    Updating to Uppercase    ${s}
    
List Manipulations
    Max of a List    ${li}

Find Unique chars of a string
    ${str2}    Remove Duplicates    ${name}
    ${unique_str_chars}    Split String    ${str2}
    FOR    ${char}    IN    @{unique_str_chars}
        ${count}    Get Character Count    ${char}    ${name}
        Log    ${char}: ${count}
    END
Count Character Frequency
    ${s1}    Set Variable    hari kanaparthi
    ${d1}    Create Dictionary

    ${char_list}    Convert To List    ${s1}    # Convert string to list of characters
 
    FOR    ${char}    IN    @{char_list}
        IF    '$char' in $d1    #  Corrected IF condition
            ${new_value}    Evaluate    ${d1}["$char"] + 1    #  Corrected dictionary lookup
            Set To Dictionary    ${d1}    ${char}    ${new_v alue}
        ELSE
            Set To Dictionary    ${d1}    ${char}    1
        END
    END

    Log    ${d1}

*** Keywords ***
Square a number
    [Arguments]    ${num}
    ${result}     Evaluate    ${num} ** 2
    Log    Square of the ${num} is ${result}
Cube of a number
    [Arguments]    ${num}
    ${result}    Evaluate    ${num} ** 3
    Log    Cube of the ${num} is ${result}

Updating to Uppercase
    [Arguments]    ${s}
    ${s}    Convert To Upper Case    ${s}
    Log    The Uppercase of the ${s} is ${s}

Reversal of string
    [Arguments]    ${s}
    # Set Global Variable    ${strReversal}
    ${strReversal}    Evaluate    ${s}[::-1]
    Log    The reversal of ${s} is ${strReversal}

Max of a List
    [Arguments]    ${li}
    ${MaxInList}    Evaluate    max(${li})
    Log    The Max number in ${li} is ${MaxInList}

Remove Duplicates
    [Arguments]    ${text}
    ${str2}    Set Variable     ${EMPTY}
    ${char_list}    Split String    ${text}
    FOR    ${char}    IN    @{char_list}
        ${exists}    Evaluate    '${char}' in '${str2}'
        IF    not ${exists}
            ${str2}    Set Variable    ${str2}${char}
        END
    END
    RETURN    ${str2}

Get Character Count
    [Arguments]    ${char}    ${text}
    ${count}    Evaluate    ${text}.count('${char}')
    RETURN    ${count}










