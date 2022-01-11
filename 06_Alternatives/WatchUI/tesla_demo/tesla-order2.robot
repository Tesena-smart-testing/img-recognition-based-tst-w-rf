*** Settings ***
Documentation    Simple test cases to check purchasing wizard
Library          SeleniumLibrary                                 implicit_wait=5    timeout=5
Library          OperatingSystem
Resource         resources/tesla.robot
Resource         resources/visual-checks.robot
Resource         resources/saucelabs.robot
Test Setup       Start Order
Test Teardown    Check Visuals

*** Variables ***
${start_url}    https://www.tesla.com/
${browser}      Chrome
# ${browser}    Firefox
# ${browser}    Internet Explorer


*** Test Cases ***
# Order Blue Tesla With Auto Pilot
TC1
     Order Tesla                                         Deep Blue Metallic    19’’ Sport Wheels    $IN3BW    YES
#    Example to fail - different wheels than expected
#    Order Tesla                                         Deep Blue Metallic    18’’ Aero Wheels     $IN3BW    YES

# Order Red Tesla No Auto Pilot
TC2
    Order Tesla    Red Multi-Coat    18’’ Aero Wheels    $IN3BW    NO
