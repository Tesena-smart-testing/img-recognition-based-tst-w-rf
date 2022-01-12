*** Settings ***
Documentation     Sikuli library exercise for Calculator
Library           Process
Library           OperatingSystem
Library           SikuliLibrary
Test Setup        Set Sikuli             # Image Path is necessary in either *** Settings *** or *** Test Cases ***
Test Teardown     Stop Remote Server     # optional but recommended, see: http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html#Stop%20Remote%20Server

*** Variables ***
${IMAGE_DIR}    ${CURDIR}\\img\\01_img_calculator\\windows

*** Test Cases ***
Calculator Test
    Open Calculator
    Choose Standard Calculator
    Calculate 1 + 2
    Choose Scientific Calculator
    Calculate 4 - 3
    Choose Programmer Calculator
    Calculate 5 * 6
    Choose Scientific Calculator
    Calculate 9 / 8

*** Keywords ***
Set Sikuli
    Directory Should Exist  ${IMAGE_DIR}
    Add Image Path          ${IMAGE_DIR}
    Set Min Similarity      0.9
    # Required when multiple monitors used - set the proper screen id (starting from 0)
    # Change screen id    1

Open Calculator
    Run Process      calc.exe

Choose ${Calculator Type} Calculator
    &{Calc Types}=  Create Dictionary   Standard=standard    Scientific=scientific    Programmer=programmer
    Click           navigation.png
    Click           ${Calc Types}[${Calculator Type}].png 

Calculate ${A} ${Operator} ${B}
    &{Operators}=    Create Dictionary   +=plus    -=minus    *=multiply    /=divide
    Click            no_${A}.png
    Click            ${Operators}[${Operator}].png
    # Click on target image within area image to make Sikuli more stable:    
    # Click In         operators.png  ${Operators}[${Operator}].png
    Click            no_${B}.png
    Click            equal.png

# Usefull links
# http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html      


