*** Settings ***
Documentation     Sikuli Library Demo for Excel
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server
Library           SikuliLibrary
Library           String

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\img\\2_excel
${SHEET NAME}     sikuli-demo

@{CELL SELECTOR LIST FOR HEADER}    H10  I10  J10
@{CELL SELECTOR LIST FOR NAME}    H11  H12  H13  H14
@{CELL SELECTOR LIST FOR POSITION}    I11  I12  I13  I14
@{CELL SELECTOR LIST FOR SALARY}    J11  J12  J13  J14

@{HEADER}   NAME  POSITION  SALARY
@{NAME}    Adam  Eva  Anna  Josef
@{POSITION}    Junior Tester  SCRUM Master  Analyst  Test Automation Engineer
@{SALARY}    35000  45000  42000  50000

*** Test Cases ***
Windows Excel Playing with Excel
    Open Excel
    Change Sheet Name
    Input Data In Excel
    Format Data As Table
    Create Graph
    Quit Excel Without Saving File

*** Keywords ***
Add Needed Image Path
    Add Image Path    ${IMAGE_DIR}

Open Excel
    Wait Until Screen Contain       search_input_win10_eng.png  5
    Input Text  search_input_win10_eng.png  Excel
    Wait Until Screen Contain	     excel_365_2021_cz.png	5
    Click    excel_365_2021_cz.png
    Wait Until Screen Contain	     excel_new_cz.png	5
    Click    excel_new_cz.png
    Wait Until Screen Contain   excel_new_empty_list_cz.png	 5
    Click    excel_new_empty_list_cz.png
    ${excel_maximize}	 Exists	 excel_maximize.png     5
    Run Keyword If       ${excel_maximize}  Click    excel_maximize.png

Change Sheet Name
    Wait Until Screen Contain       excel_365_sheet1_cz.png  5
    Right Click    excel_365_sheet1_cz.png
    Wait Until Screen Contain       excel_365_rename_sheet_cz.png  5
    Click    excel_365_rename_sheet_cz.png
    Wait Until Screen Contain       excel_365_sheet1_highlighted_cz.png  5
    Press Special Key    BACKSPACE
    Input Text           ${EMPTY}  ${SHEET NAME}
    Press Special Key    ENTER

Input Data In Excel
    Wait Until Screen Contain   excel_cell_selector.png	 10

    ${Header Length}    Get Length   ${HEADER}
    Set Test Variable   ${Header Length}
    ${Name Length}      Get Length   ${NAME}
    ${Position Length}  Get Length   ${POSITION}
    ${Salary Length}    Get Length   ${SALARY}

    Run Keyword If  ${Header Length} != 0     Input Header Data In Excel
    Run Keyword If  ${Name Length} != 0       Input Name Data In Excel
    Run Keyword If  ${Position Length} != 0   Input Position Data In Excel
    Run Keyword If  ${Salary Length} != 0     Input Salary Data In Excel

Input Header Data In Excel
    ${length}=    Get Length    ${CELL SELECTOR LIST FOR HEADER}
    FOR    ${i}    IN RANGE    ${length}
        Input Text  excel_cell_selector.png  ${CELL SELECTOR LIST FOR HEADER}[${i}]
        Sleep                0.2s
        Press Special Key    ENTER
        Input Text           ${EMPTY}  ${HEADER}[${i}]
        Press Special Key    ENTER
    END

Input Name Data In Excel
    ${length}=    Get Length    ${CELL SELECTOR LIST FOR NAME}
    FOR    ${i}    IN RANGE    ${length}
        Input Text  excel_cell_selector.png  ${CELL SELECTOR LIST FOR NAME}[${i}]
        Sleep                0.2s
        Press Special Key    ENTER
        Input Text           ${EMPTY}  ${NAME}[${i}]
        Press Special Key    ENTER
    END

Input Position Data In Excel
    ${length}=    Get Length    ${CELL SELECTOR LIST FOR POSITION}
    FOR    ${i}    IN RANGE    ${length}
        Input Text  excel_cell_selector.png  ${CELL SELECTOR LIST FOR POSITION}[${i}]
        Sleep                0.2s
        Press Special Key    ENTER
        Input Text           ${EMPTY}  ${POSITION}[${i}]
        Press Special Key    ENTER
    END

Input Salary Data In Excel
    ${length}=    Get Length    ${CELL SELECTOR LIST FOR SALARY}
    FOR    ${i}    IN RANGE    ${length}
        Input Text  excel_cell_selector.png  ${CELL SELECTOR LIST FOR SALARY}[${i}]
        Sleep                0.2s
        Press Special Key    ENTER
        Input Text           ${EMPTY}  ${SALARY}[${i}]
        Press Special Key    ENTER
    END

Format Data As Table
    Wait Until Screen Contain	     excel_365_table_formatter_cz.png	5
    Click    excel_365_table_formatter_cz.png
    Wait Until Screen Contain	     excel_365_first_table_format_cz.png	5
    Click    excel_365_first_table_format_cz.png
    Wait Until Screen Contain	     excel_365_create_table_cz.png	5
    Press Special Key    BACKSPACE
    Wait Until Screen Contain	     excel_365_create_table_cell_range_cz.png	5
    Input Text    excel_365_create_table_cell_range_cz.png  ${CELL SELECTOR LIST FOR HEADER}[0]:${CELL SELECTOR LIST FOR SALARY}[-1]
    Run Keyword If  ${Header Length} == 0   Click    excel_365_table_contains_header_cz.png
    Sleep  1s
    Click In        excel_365_ok_cancel_button_cz.png      excel_365_ok_button_cz.png

Create Graph
    Wait Until Screen Contain	     excel_365_insert_cz.png	5
    Click    excel_365_insert_cz.png
    Wait Until Screen Contain	     excel_365_bar_chart.png	5
    Click    excel_365_bar_chart.png
    Wait Until Screen Contain	     excel_365_first_bar_chart.png	5
    Click    excel_365_first_bar_chart.png
    Sleep   1s
    Mouse Move  excel_365_graph_corner.png
    Mouse Down	LEFT
    Drag And Drop By Offset  excel_365_graph_corner.png  300  -150  # bolo potreba pozorne vyberať obrázok časti grafu v exceli s kt. má pracovať daná metóda

#    Press Special Key    ARROW_RIGHT

#    ImageHorizonLibrary.Locate    excel_365_graph_corner.png
#    ImageHorizonLibrary.Move To     1000  1000

#    Drag And Drop By Offset  drag.png  1000  1000
#    Drag And Drop   excel_365_output_drag.png      excel_365_output_drop.png

Quit Excel Without Saving File
    ${close_excel_365}	 Exists	 close_excel_365_2021.png	5
    Run Keyword If       ${close_excel_365}  Click    close_excel_365_2021.png
    ${dont_save_excel}	 Exists	 dont_save_excel_365_2021_cz.png	5
    Run Keyword If       ${dont_save_excel}  Click    dont_save_excel_365_2021_cz.png