*** Settings ***
Documentation      RDA.Desktop Demo
Library            RPA.Desktop  


*** Variables ***
${IMAGE_DIR}       ${CURDIR}\\img
${NOTEPAD_EXE}     C:\\WINDOWS\\system32\\notepad.exe
${entry}            entry

*** Test Cases ***
Notepad Test
    [Arguments]    ${entry}
    Open application    Notepad
    Click         image:%{ROBOT_ROOT}/images/create.png
    Type text     ${entry}
    Press keys    ctrl    s
    Press keys    enter
              

*** Keywords ***