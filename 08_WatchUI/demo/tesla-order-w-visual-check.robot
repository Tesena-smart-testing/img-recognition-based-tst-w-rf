*** Settings ***
Documentation     Simple test cases to check purchasing wizard
Library           SeleniumLibrary                                 implicit_wait=5    timeout=5
Library           OperatingSystem
Library           WatchUI
Resource          resources/tesla.robot
Resource          resources/visual-checks.robot
# Resource        resources/saucelabs.robot
Test Setup        Start Order
Test Teardown     Check Visuals
Suite Teardown    Close All Browsers


*** Variables ***
${start_url}    https://www.tesla.com/
${browser}      Chrome
# ${browser}    Firefox
# ${browser}    Internet Explorer


*** Test Cases ***
TC1    # Order Blue Tesla With Auto Pilot
       Order Tesla                                         Deep Blue Metallic    19’’ Sport Wheels    Black and White    YES
#      Example to fail - different wheels than expected
       # Order Tesla                                         Deep Blue Metallic    18’’ Aero Wheels    Black and White    YES

TC2    # Order Red Tesla No Auto Pilot
       Order Tesla                        Red Multi-Coat    18’’ Aero Wheels    Black and White    NO
