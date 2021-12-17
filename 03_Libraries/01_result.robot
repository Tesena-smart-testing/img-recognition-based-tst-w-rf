*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    DateTime

*** Variables ***
${URL}        https://www.amazon.com
${BROWSER}    Chrome

${SEARCH BOX ELEMENT}      id:twotabsearchtextbox
${SEARCH SUBMIT BUTTON}    id:nav-search-submit-button

${SEARCH TERM}    Kindle

*** Test Cases ***
Open home page and take screenshot
    Open Browser               ${URL}    ${BROWSER}
    Capture Page Screenshot
    Close Browser

Web search
    Open Browser                ${URL}                          ${BROWSER}
    Input Text                  ${SEARCH BOX ELEMENT}           ${SEARCH TERM}
    Click Element               ${SEARCH SUBMIT BUTTON}
    Wait Until Page Contains    results for "${SEARCH TERM}"
    [Teardown]                  Close Browser

Web respons time should be under 500 ms
    Create Session    web                             ${URL}
    ${headers}=       Create Dictionary               User-Agent=RFTest
    ${resp}=          Get On Session                  web                  /    headers=${headers}
    ${resp time}=     Convert Time	${resp.elapsed}
    Should Be True    ${resp time} < 500

Web status OK (200)
    Create Session      web                  ${URL}
    Log                 web
    ${headers}=         Create Dictionary    User-Agent=RFTest
    ${resp}=            Get On Session       web                  /    headers=${headers}
    Status Should Be    200                  ${resp}

Check web NOK status
    Create Session      web                  ${URL} 
    ${headers}          Create Dictionary    User-agent=RFTest
    ${response}         Get On Session       web                  /asdf    headers=${headers}    expected_status=404
    Status Should Be    404                  ${response}


# ==============================
# Some more details here:
# ==============================
#    Selenium library: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#    Xpath cheatsheet: https://devhints.io/xpath#chaining-order

#    Requests library: https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html