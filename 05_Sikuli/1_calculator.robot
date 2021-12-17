*** Settings ***
Documentation     Sikuli library excercise for Calculator
Library           SikuliLibrary
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server

*** Variables ***
${IMAGE_DIR}    ${CURDIR}\\img\\1_calculator

*** Test Cases ***
Calculator Test
    Open Windows Calculator App
    Try 1 + 2
    Choose Type Of Calculator   scientific
    Try 1 + 2

*** Keywords ***
Add Needed Image Path
    Add Image Path  ${IMAGE_DIR}

Open Windows Calculator App
    Input Text  search_input_win10_eng.png  Calculator
    Click   calculator_app_win10_eng.png   10

Try 1 + 2
    Click   no_1.png
    Click   operator_plus.png
    Click   no_2.png
    Click   operator_equals.png

Choose Type Of Calculator
    [Arguments]    ${Calculator Type}
    Click   open_navigation.png
    Click   ${Calculator Type}_calculator.png


