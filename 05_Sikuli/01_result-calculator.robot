*** Settings ***
Documentation     Sikuli library exercise for Calculator
Library           SikuliLibrary
Test Setup        Set Sikuli Image Path  # Image Path is necessary in either *** Settings *** or *** Test Cases ***
Test Teardown     Stop Remote Server     # optional but recommended, see: http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html#Stop%20Remote%20Server

*** Variables ***
${IMAGE_DIR}    ${CURDIR}\\img\\01_img_calculator

*** Test Cases ***
Calculator Test
    Open Windows Calculator App
    Choose Type Of Calculator   standard
    Calculate 1 + 2
    Choose Type Of Calculator   scientific
    Calculate 1 + 2

*** Keywords ***
Set Sikuli Image Path
    Add Image Path  ${IMAGE_DIR}

Open Windows Calculator App
    Input Text  search_input_win10_eng.png  Calculator
    Click   calculator_app_win10_eng.png   10

Calculate 1 + 2
    Click   no_1.png
    Click   operator_plus.png
    Click   no_2.png
    Click   operator_equals.png

Choose Type Of Calculator
    [Arguments]    ${Calculator Type}
    Click   open_navigation.png
    Click   ${Calculator Type}_calculator.png


