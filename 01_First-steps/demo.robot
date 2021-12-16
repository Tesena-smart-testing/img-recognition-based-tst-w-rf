*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${search_term}    "Porsche"

*** Test Cases ***
eBay search Porsche
    Search for term                  ${search_term}
    Search results should contain    ${search_term}

*** Keywords ***
Search for term
   [Arguments]      ${search_term}    
   Input text       id=gh-ac          ${search_term}
   Click element    id=gh-btn

Search results should contain
   [Arguments]               ${search_term}
   Element should contain    css=h3            ${search_term}
