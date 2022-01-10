*** Settings ***
Documentation     Selenium and Sikuli library demo in browser and outlook.
Library           SeleniumLibrary
Library           SikuliLibrary
Test Teardown     Close All Browsers

*** Variables ***
# ---------------------------------------- Selenium Variables ----------------------------------------------------
${URL}                      https://www.amazon.com
${BROWSER}                  Chrome
${SEARCH TERM}              Kindle
${SEARCH BOX ELEMENT}       id:twotabsearchtextbox
${SEARCH SUBMIT BUTTON}     id:nav-search-submit-button
${SEARCH RESULT 1}          //img[@data-image-index="1"]
${SHARE VIA EMAIL}          id:swfImageMailTo

# ---------------------------------------- Sikuli Variables ------------------------------------------------------
${IMAGE_DIR}                ${CURDIR}\\img\\04_img_outlook
${EMAIL ADDRESS}            leila.miri@tesena.com

*** Test Cases ***
Outlook Test
    Open Browser
    Find Search Term
    Open Detail and Share
    Sikuli Image Path
    Outlook Send Email

*** Keywords ***
Sikuli Image Path
    SikuliLibrary.Add Image Path                ${IMAGE_DIR}

Open Browser
    SeleniumLibrary.Open Browser                ${URL}                          ${BROWSER}
    SeleniumLibrary.Maximize Browser Window

Find Search Term    
    SeleniumLibrary.Input Text                  ${SEARCH BOX ELEMENT}           ${SEARCH TERM}
    SeleniumLibrary.Click Element               ${SEARCH SUBMIT BUTTON}
    SeleniumLibrary.Wait Until Page Contains    results for "${SEARCH TERM}"
  
Open Detail and Share  
    Wait Until Keyword Succeeds  10  1s  SeleniumLibrary.Click Element          ${SEARCH RESULT 1}
    Wait Until Keyword Succeeds  10  1s  SeleniumLibrary.Click Element          ${SHARE VIA EMAIL}

 Outlook Send Email
    SikuliLibrary.Wait Until Screen Contain     to_email.png  15
    SikuliLibrary.Click                         to_email.png
    SikuliLibrary.Input Text                    ${EMPTY}  ${EMAIL ADDRESS}
    SikuliLibrary.Click                         send.png
    
   