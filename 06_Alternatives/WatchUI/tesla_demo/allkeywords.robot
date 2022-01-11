*** Settings ***
Documentation   Example of usage of all KWs in WatchUI Robot Framework library
Library         SeleniumLibrary
Library         WatchUI
Test Teardown   Close All Browsers

*** Variables ***
${start_url}        https://www.tesla.com/
${browser}          Chrome

*** Test Cases ***
Create screenshots
    Open Browser            ${start_url}      ${browser}
    Create screens          800  600  1280  800  1440  900  save_folder=outputs  screen_name=screen

Two images compare
    Compare images          outputs/screen800x600.png    outputs/screen800x600.png    outputs

Screen compare
    Open Browser            ${start_url}      ${browser}
    Set window size         800     600
    Sleep                   7
    Compare screen          outputs/screen800x600.png  save_folder=outputs

Create region
    Open Browser            ${start_url}      ${browser}
    Set window size         1280     800
    Sleep                   2
    Create area             0   0   300  200  save_folder=outputs

Area Compare
    Open Browser            ${start_url}      ${browser}
    Set window size         1280     800
    Sleep                   2
    Compare screen areas    0   0   1179     704     outputs/screen800x600.png  save_folder=outputs

Comparing screen without some region
    Open Browser                        ${start_url}      ${browser}
    Set window size                     1280     800
    Sleep                               2
    Compare screen without areas        outputs/screen1280x800.png   120  100  1800  500  save_folder=outputs

Area compare with info
    Open Browser                        ${start_url}    ${browser}
    Set window size                     800     600
    Sleep                               7
    Compare screen get information      1c.png  save_folder=outputs  folder_csv=outputs
