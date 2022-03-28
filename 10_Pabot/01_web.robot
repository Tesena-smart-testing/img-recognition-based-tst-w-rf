*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.amazon.com
${BROWSER}    headlesschrome

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


# ==============================
# Some more details here:
# ==============================
#    Selenium library: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#    Xpath cheatsheet: https://devhints.io/xpath#chaining-order