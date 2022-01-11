*** Settings ***
Library          Process
Library          OperatingSystem
Library          SikuliLibrary
Test Setup       Set Sikuli            # Image Path is necessary in either *** Settings *** or *** Test Cases ***
Test Teardown    Stop Remote Server    # Optional but recommended, see: http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html#Stop%20Remote%20Server


*** Variables ***
${IMAGE_DIR}    ${CURDIR}/01_img_calculator/mac


*** Test Cases ***
Calculator Test
    Open Calculator
    Choose Type Of Calculator    Basic
    Calculate 1 + 2
    Choose Type Of Calculator    Scientific
    Calculate 4 * 5


*** Keywords ***
Set Sikuli
    # In case folder doesn't exist Sikuli provide not very clear error message so I am checking it before
    Directory Should Exist    ${IMAGE_DIR}
    Add Image Path            ${IMAGE_DIR}

    # Reduce sensitivity of Sikuli to make it more stable ... maybe .6 is too little but it just work for me ok
    Set Min Similarity    0.6

    # Required when multiple monitors used - set the proper screen id (starting from 0)
    Change screen id    1


Open Calculator
    Run Process    open    -a    calculator


Calculate ${A} ${Operator} ${B}
    &{Operators}=    Create Dictionary                +=plus    -=minus    *=multiply    /=divide
    Click            no_${A}.png
    Click            ${Operators}[${Operator}].png
    Click            no_${B}.png
    Click            equal.png


Choose Type Of Calculator
    [Arguments]            ${Calculator Type}=Basic
    &{Calc Types}=         Create Dictionary                    Basic=1    Scientific=2    Programmer=3
    Type With Modifiers    ${Calc Types}[${Calculator Type}]    CMD



# Usefull links
# http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html
#    For typing special characters you can use the following KW: `Type With Modifiers    3    CMD`
#    http://doc.sikuli.org/javadoc/org/sikuli/script/Key.html