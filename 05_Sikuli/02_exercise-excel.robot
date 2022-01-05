*** Settings ***
Documentation     Sikuli library exercise for Excel
Library           SikuliLibrary
Library           String
Test Setup        Sikuli Image Path
Test Teardown     Stop Remote Server

*** Variables ***
${IMAGE_DIR}            ${CURDIR}\\img\\02_img_excel
${COMMON_IMAGE_DIR}     ${CURDIR}\\img\\00_img_common

${SHEET NAME}     sikuli-demo

@{CELL SELECTOR LIST FOR HEADER}    H10  I10  J10
@{CELL SELECTOR LIST FOR NAME}      H11  H12  H13  H14
@{CELL SELECTOR LIST FOR POSITION}  I11  I12  I13  I14
@{CELL SELECTOR LIST FOR SALARY}    J11  J12  J13  J14

@{HEADER}       NAME  POSITION  SALARY
@{NAME}         Adam  Eva  Anna  Josef
@{POSITION}     Junior Tester  SCRUM Master  Analyst  Test Automation Engineer
@{SALARY}       35000  45000  42000  50000

*** Test Cases ***
Excel Test
    # Exercise: Write test with these keywords provided:
    Open Excel
    Change Sheet Name
    Input Data In Excel
    Format Data As Table
    Create And Move Graph
    Quit Excel Without Saving File

*** Keywords ***
Sikuli Image Path
    Add Image Path    ${IMAGE_DIR}
    Add Image Path    ${COMMON_IMAGE_DIR}

