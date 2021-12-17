*** Settings ***
Documentation    This is file to show first steps with RF 

Test Timeout    15s    

*** Test Cases ***
Simple test
    [Documentation]    Hopefully you'll like it!
    [Tags]             my1st
    [Timeout]          2s
    Log                Simple message into log
    Log                second into log
    # [Teardown]

Simple test w own KW
    [Documentation]    This is my second test
    [Tags]             second
    Simple KW
    Log                We will use our own KW 
    ${x}               My own KW w Return
    Log                Value from KW: ${x} 


*** Keywords ***
Simle KW
    Log    This is my first KW

My own KW w Return
    [Documentation]    My keyword returns 2x X where X is argument
    [Arguments]        ${x}=5
    ${r}               Evaluate                                       ${x}*2
    Log                2 x ${x} = ${r}
    [Return]           ${r}
