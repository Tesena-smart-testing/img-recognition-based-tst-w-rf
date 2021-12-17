*** Settings ***
Test Template    Create New User

*** Test Cases ***
Create New User 1    Marcel
Create New User 2    Leila
Create New User 3    Maria

*** Keywords ***
Create New User
    [Arguments]    ${username}
    Log            Creating new user
    Log            Validating user name is ${username}