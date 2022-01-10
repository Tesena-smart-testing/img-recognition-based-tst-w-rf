*** Settings ***
Documentation     Common Keywords for tests
Library           SeleniumLibrary
Library           SikuliLibrary

*** Variables ***
# ---------------------------------------- Selenium Common Variables ----------------------------------------------------
${BROWSER}                  Chrome
# ---------------------------------------- Sikuli Common Variables ------------------------------------------------------
${IMAGE_COMMON_DIR}         .\\img\\00_img_common

*** Keywords ***
Open Browser
    [Arguments]    ${URL}
    SeleniumLibrary.Open Browser    ${URL}                    ${BROWSER}
    SeleniumLibrary.Maximize Browser Window
    
Set Sikuli Image Path
    [Arguments]    ${IMAGE_DIR}
    SikuliLibrary.Add Image Path                              ${IMAGE_DIR}
    SikuliLibrary.Add Image Path                              ${IMAGE_COMMON_DIR}

Open Desktop Application
    [Arguments]    ${APPLICATION}
    SikuliLibrary.Wait Until Screen Contain       search_input_win10_eng.png         15
    SikuliLibrary.Input Text                      search_input_win10_eng.png  ${APPLICATION}    
    SikuliLibrary.Wait Until Screen Contain	      ${APPLICATION}_app_win10_icon.png	 15
    SikuliLibrary.Click                           ${APPLICATION}_app_win10_icon.png    

Quit Application Without Saving File
    [Arguments]    ${APPLICATION}
    SikuliLibrary.Wait Until Screen Contain       close_${APPLICATION}.png           15
    SikuliLibrary.Click                           close_${APPLICATION}.png          
    SikuliLibrary.Wait Until Screen Contain       dont_save_${APPLICATION}_en.png    15
    SikuliLibrary.Click                           dont_save_${APPLICATION}_en.png    