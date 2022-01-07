*** Settings ***
Library            AutoItLibrary

*** Variables ***
${NOTEPAD_EXE}  C:\\WINDOWS\\system32\\notepad.exe
${WORKING_DIR}  C:\\Users\\LeilaMiriTesena\\backup\\Desktop

*** Test Cases ***
Notepad Test
    Run                  ${NOTEPAD_EXE}      ${WORKING_DIR}    3
    Win Wait Active      Untitled - Notepad
    Send                 Happy New Year 2022!
    Win Close            *Untitled - Notepad