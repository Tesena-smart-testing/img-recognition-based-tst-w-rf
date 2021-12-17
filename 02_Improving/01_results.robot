*** Settings ***
Suite Setup       Setup suite
Suite Teardown    Clean up suite
Test Setup        Setup test
Test Teardown     Clean up test

*** Variables ***
${VALUE}     123
${AMOUNT}    12

${SLEEP}    5

${SCALAR}         1
@{LIST}           1 2
&{DICTIONARY}     a=1       b=2
${ENVIRONMENT}    %{TMP}

*** Test Cases ***
Failing test
    [Documentation]    This is my third test 
    [Tags]             first 
    [Timeout]          2s
    Sleep              ${SLEEP}
    [Teardown]         Log To Console            My cool test just do nothing!? 

My third test
    Log    ${SCALAR}
    Log    ${LIST}
    Log    ${DICTIONARY}
    Log    ${ENVIRONMENT}


*** Keywords ***
Setup suite
    Log    Setting up the suite . . .

Clean up suite
    Log    Cleaning up the suite . . .

Setup test
    Log    Setting up the test . . .

Clean up test
    Log    Cleaning up the test . . .
