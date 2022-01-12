*** Settings ***
Documentation    Simple example using WatchUI for Visual Checks test types.
Library          SeleniumLibrary                                               implicit_wait=5    timeout=5
Library          WatchUI
Test Setup       Start Test
Test Teardown    Close Browser

*** Variables ***
${URL}        https://www.spotify.com/cz/
${BROWSER}    Chrome
@{SCREENS}    1080                           1920    720    1280    720    1334    1440    2960    1440    2560    1125    2436    640    1136    540    960    1180    2160    480    854
${PATH}       outputs


*** Test Cases ***
# Level 1: No automation, fully manual process

# Level 2: Use simulators to set up environments (e.g. saucelabs or browserstack )

# Level 3: Collect screenshots & manuall check
Home Page
    Create Screens    @{SCREENS}    save_folder=${PATH}    screen_name=spotify-

# Level 4: Compare automatically with baseline
Check Home Page
    ${width}           ${height} =                               Set Variable           720    1280
    Set window size    ${width}                                  ${height}
    Insert bug
    Compare Screen     ${PATH}/spotify-${width}x${height}.png    save_folder=${PATH}

# Level 5: Dynamically check elements - no layout dependent

# Level 6: Autonomous Visual Testing Bot


*** Keywords ***
Start Test
     [Documentation]        Initial set up and start for each test
     Set Selenium Speed     .5 second                                 # slow down for demo
     Open Browser           ${URL}                                    ${BROWSER}
#    Open Remote Browser    ${URL}                                    internet explorer       #${BROWSER}

Insert bug
    Execute JavaScript    document.getElementsByTagName("h1")[0].remove();
