*** Settings ***
Documentation      ImageHorizonLibrary Demo
Library            ImageHorizonLibrary   ${CURDIR}\\img
# Test Setup         ImageHorizonLibrary Image Path  # Image Path is necessary in either *** Settings *** or *** Test Cases ***

*** Variables ***
${IMAGE_DIR}       ${CURDIR}\\img
${POWERPOINT_EXE}  "C:\\Program Files\\Microsoft Office\\root\\Office16\\POWERPNT.EXE"
${TITLE}           Tesena wishes everyone a happy new year.
${SUBTITLE}        Enjoy this image-recognition based automation with Image Horizon Library & Robot Framework.

*** Test Cases ***
PowerPoint Test
    Open PowerPoint and Set Confidence
    Input Text in PowerPoint
    Choose Design
    Wait And Close PowerPoint               

*** Keywords ***
# ImageHorizonLibrary Image Path
    # Set Reference Folder            ${IMAGE_DIR}

Open PowerPoint and Set Confidence
    Launch Application              ${POWERPOINT_EXE}
    ${Confidence}                   Set Confidence          0.7 
    Set Test Variable               ${Confidence}

Input Text in PowerPoint
    Wait For                        blank_presentation.png  10
    Click Image                     blank_presentation.png
    Wait For                        title.png               10
    Click Image                     title.png
    Type                            ${TITLE}
    Wait For                        subtitle.png            10
    Click Image                     subtitle.png
    Type                            ${SUBTITLE}

Choose Design
    Set Confidence                  0.5
    Wait For                        design.png              10
    Click Image                     design.png
    Wait For                        design_ideas.png        10
    Click Image                     design_ideas.png
    Wait For                        design_ideas_text.png   10
    Sleep                           2s
    Click To The Below Of Image	    design_ideas_text.png   100     1     left    0.5

Wait And Close PowerPoint    
    Sleep                           10s
    Wait For                        close.png               10
    Click Image                     close.png
    Wait For                        dont_save.png           10
    Click Image                     dont_save.png    