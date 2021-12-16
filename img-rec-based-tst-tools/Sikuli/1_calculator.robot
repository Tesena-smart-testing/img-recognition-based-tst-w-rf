*** Settings ***
Documentation     Sikuli library excercise for calculator
Library           SikuliLibrary
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server

*** Variables ***
${IMAGE_DIR}    ${CURDIR}\\img\\1_calculator

*** Test Cases ***
Calculator Test
    Wait Until Screen Contain    search_input_win10_eng.png   10
    

*** Keywords ***
Add Needed Image Path
    Add Image Path  ${IMAGE_DIR}


