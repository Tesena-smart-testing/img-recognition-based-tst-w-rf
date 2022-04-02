*** Settings ***
Library    RequestsLibrary
Library    DateTime

*** Variables ***
${URL}    https://www.tesla.com

*** Test Cases ***
Web respons time should be under 500 ms
    Create Session    web                             ${URL}               disable_warnings=true
    ${headers}=       Create Dictionary               User-Agent=RFTest
    ${resp}=          Get On Session                  web                  /                        headers=${headers}
    ${resp time}=     Convert Time	${resp.elapsed}
    Should Be True    ${resp time} < 500

Web status OK (200)
    Create Session      web                  ${URL}               disable_warnings=true
    Log                 web
    ${headers}=         Create Dictionary    User-Agent=RFTest
    ${resp}=            Get On Session       web                  /                        headers=${headers}
    Status Should Be    200                  ${resp}

Check web NOK status
    Create Session      web                  ${URL}               disable_warnings=true
    ${headers}          Create Dictionary    User-agent=RFTest
    ${response}         Get On Session       web                  /asdf                    headers=${headers}    expected_status=404
    Status Should Be    404                  ${response}


# ==============================
# Some more details here:
# ==============================
#    Requests library: https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html