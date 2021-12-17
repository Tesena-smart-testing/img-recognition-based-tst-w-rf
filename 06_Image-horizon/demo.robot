*** Settings ***
Documentation     ImageHorizonLibrary demo
Library           ImageHorizonLibrary  	${CURDIR}\\img
Library           SikuliLibrary
Test Setup        Add Needed Image Path  # Sikuli needs this
Test Teardown     Stop Remote Server  # Sikuli needs this

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\img

*** Test Cases ***
Demo Test
    Demo

*** Keywords ***
Add Needed Image Path  # Sikuli needs this
    Add Image Path    ${IMAGE_DIR}

Demo
#    Wait For      search_input_win10_eng.png
#    Click Image   search_input_win10_eng.png
#    Type          OneNote
#   shows PASS but does not click in the column nor types text

#    Launch Application	"C:\WINDOWS\write.exe" - FileNotFoundError: [WinError 2] The system cannot find the file specified

#    Wait Until Screen Contain       search_input_win10_eng.png  15
#    Input Text                      search_input_win10_eng.png  OneNote
#    Click Image                     onenote_app_win10_2.png


    ${image location}=	Locate	search_input_win10_eng.png
    Click To The Above Of	${image location}	200
#    @{coordinates}=	Create List	${600}	${500}
#    Click To The Above Of	${coordinates}	100


# These library keywords either seems not to work or some do but it is mainly playing with coordinates that are mandatory in arguments
# Overall not suitable library for our purposes but I will gove it a little more time