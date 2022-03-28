*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.amazon.com
${BROWSER}    Chrome

${SEARCH BOX ELEMENT}      id:twotabsearchtextbox
${SEARCH SUBMIT BUTTON}    id:nav-search-submit-button

${SEARCH TERM}    Kindle

@{_tmp}
    ...    browserName: ${browserName},
    ...    platformName: ${platformName},
    ...    browserVersion: ${browserVersion},
    ...    username: %{SAUCE_USERNAME},
    ...    accessKey: %{SAUCE_ACCESS_KEY},
    ...    name: ${SUITE_NAME},   # TODO: Fix - doesnt work with W3C capabilities
    ...    build: tesena-training-sample-build  # TODO: Fix - doesnt work with W3C capabilities

${browser}         ${browserName}
${capabilities}    ${EMPTY.join(${_tmp})} 
${remote_url}      https://%{SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.eu-central-1.saucelabs.com:443/wd/hub

*** Test Cases ***
Open home page and take screenshot
    Open Remote Browser
    Capture Page Screenshot
    Close Browser

Web search
    Open Remote Browser
    Input Text                  ${SEARCH BOX ELEMENT}           ${SEARCH TERM}
    Click Element               ${SEARCH SUBMIT BUTTON}
    Wait Until Page Contains    results for "${SEARCH TERM}"
    [Teardown]                  Close Browser

*** Keywords ***
Open Remote Browser
    Open Browser    ${URL}                                  ${BROWSER}
    ...             remote_url=${remote_url}
    ...             desired_capabilities=${capabilities}


# ==============================
# Some more details here:
# ==============================
#    Selenium library: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#    Xpath cheatsheet: https://devhints.io/xpath#chaining-order
#    Saucelabs examples: https://github.com/saucelabs-training/demo-python