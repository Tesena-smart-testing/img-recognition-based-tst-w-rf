*** Settings ***
Resource    resources/common.robot
Library     RequestsLibrary

*** Test Cases ***
Web status OK (200)
    Create Session      web                  ${URL}               disable_warnings=true
    Log                 web
    ${headers}=         Create Dictionary    User-Agent=RFTest
    ${resp}=            Get On Session       web                  /                        headers=${headers}
    Status Should Be    200                  ${resp}

Check web NOK status (404)
    Create Session      web                  ${URL} 
    ${headers}          Create Dictionary    User-agent=RFTest
    ${response}         Get On Session       web                  /asdf    headers=${headers}    expected_status=404
    Status Should Be    404                  ${response}
