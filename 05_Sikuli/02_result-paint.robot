*** Settings ***
Documentation     Selenium, Sikuli and ImageHorizonLibrary exercise to automate browser and windows paint application.
Library           SeleniumLibrary
Library           SikuliLibrary
Library           ImageHorizonLibrary
Test Teardown     Close All Browsers
Resource          ${CURDIR}\\resources\\common.robot   # file for common keywords

*** Variables ***
# Selenium Variables:
${AMAZON_URL}               https://www.amazon.com
${SEARCH TERM}              Kindle
${SEARCH BOX ELEMENT}       id:twotabsearchtextbox
${SEARCH SUBMIT BUTTON}     id:nav-search-submit-button

# Sikuli Variables:
${IMAGE_DIR}                .\\img\\02_img_paint
${PAINT}                    paint

*** Test Cases ***
Paint Test
    Open Browser                            ${AMAZON_URL} 
    Find Search Term And Make Printscreen
    Set Sikuli Image Path                   ${IMAGE_DIR}     
    Open Desktop Application                ${PAINT}  
    Insert and Resize Printscreen 
    Quit Application Without Saving File    ${PAINT} 

*** Keywords ***
Find Search Term And Make Printscreen    
    SeleniumLibrary.Input Text                  ${SEARCH BOX ELEMENT}           ${SEARCH TERM}
    SeleniumLibrary.Click Element               ${SEARCH SUBMIT BUTTON}
    SeleniumLibrary.Wait Until Page Contains    results for "${SEARCH TERM}"
    SikuliLibrary.Press Special Key	            PRINTSCREEN  
    # Alternative option:    
    # ImageHorizonLibrary.Press Combination       KEY.printscreen

Insert and Resize Printscreen
    SikuliLibrary.Wait Until Screen Contain	    untitled_paint_en.png	15
    ImageHorizonLibrary.Press Combination       KEY.ctrl    KEY.v  
    SikuliLibrary.Wait Until Screen Contain	    resize_en.png	15
    SikuliLibrary.Click	                        resize_en.png	15
    SikuliLibrary.Wait Until Screen Contain	    horizontal_area_image.png	15
    SikuliLibrary.Double Click In               horizontal_area_image.png  target_area.png
    SikuliLibrary.Press Special Key	            DELETE
    SikuliLibrary.Input Text                    ${EMPTY}  50
    SikuliLibrary.Click	                        ok_button.png	15
   