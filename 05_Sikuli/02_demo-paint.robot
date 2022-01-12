*** Settings ***
Documentation     Selenium and Sikuli demo to automate browser and windows paint application.
Library           SeleniumLibrary
Library           SikuliLibrary
Test Setup        Set Sikuli  
Test Teardown     Close All Browsers

*** Variables ***
# Selenium Variables:
${URL}                      https://www.amazon.com
${BROWSER}                  Chrome
${SEARCH TERM}              Kindle
${SEARCH BOX ELEMENT}       id:twotabsearchtextbox
${SEARCH SUBMIT BUTTON}     id:nav-search-submit-button

# Sikuli Variables:
${IMAGE_DIR}                .\\img\\02_img_paint

*** Test Cases ***
Paint Test
    Open Browser                            
    Find Search Term And Make Printscreen    
    Open Desktop Application                
    Insert and Resize Printscreen 
    Quit Application Without Saving File

*** Keywords ***
Set Sikuli
    SikuliLibrary.Add Image Path                ${IMAGE_DIR}
    Set Min Similarity                          0.7

Open Browser
    SeleniumLibrary.Open Browser                ${URL}      ${BROWSER}
    SeleniumLibrary.Maximize Browser Window

Find Search Term And Make Printscreen    
    SeleniumLibrary.Input Text                  ${SEARCH BOX ELEMENT}       ${SEARCH TERM}
    SeleniumLibrary.Click Element               ${SEARCH SUBMIT BUTTON}
    SeleniumLibrary.Wait Until Page Contains    results for "${SEARCH TERM}"
    SikuliLibrary.Press Special Key	            PRINTSCREEN  
  
Open Desktop Application
    SikuliLibrary.Wait Until Screen Contain     search_input_win10_eng.png  15
    SikuliLibrary.Input Text                    search_input_win10_eng.png  Paint    
    SikuliLibrary.Wait Until Screen Contain	    paint_app_win10_icon.png    15
    SikuliLibrary.Click                         paint_app_win10_icon.png 

Insert and Resize Printscreen
    SikuliLibrary.Wait Until Screen Contain	    untitled_paint_en.png	    15
    SikuliLibrary.Type With Modifiers           v   CTRL
    SikuliLibrary.Wait Until Screen Contain	    resize_en.png	            15
    SikuliLibrary.Click	                        resize_en.png	            15
    SikuliLibrary.Wait Until Screen Contain	    horizontal_area_image.png   15
    SikuliLibrary.Double Click In               horizontal_area_image.png   target_image.png
    SikuliLibrary.Press Special Key	            DELETE
    SikuliLibrary.Input Text                    ${EMPTY}                    50
    SikuliLibrary.Click	                        ok_button.png	            15

Quit Application Without Saving File
    SikuliLibrary.Wait Until Screen Contain     close_paint.png             15
    SikuliLibrary.Click                         close_paint.png          
    SikuliLibrary.Wait Until Screen Contain     dont_save_paint_en.png      15
    SikuliLibrary.Click                         dont_save_paint_en.png        
   