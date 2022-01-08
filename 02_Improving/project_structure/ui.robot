*** Settings ***
Resource    resources/common.robot
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
# ${BROWSER}    headlesschrome

${SEARCH BOX ELEMENT}      id:twotabsearchtextbox
${SEARCH SUBMIT BUTTON}    id:nav-search-submit-button

${SEARCH TERM}    Kindle

*** Test Cases ***
Web search
    Open Browser                ${URL}                          ${BROWSER}
    Input Text                  ${SEARCH BOX ELEMENT}           ${SEARCH TERM}
    Click Element               ${SEARCH SUBMIT BUTTON}
    Wait Until Page Contains    results for "${SEARCH TERM}"
    [Teardown]                  Close Browser
