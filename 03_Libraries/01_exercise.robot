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
    # Exercise: Implement the steps to open the home page, take a screenshot and close the browser
    #   - Selenium library: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

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

Web status OK
    # Exercise: Implement test to check status code is 200
    #   - Requests library: https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html

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