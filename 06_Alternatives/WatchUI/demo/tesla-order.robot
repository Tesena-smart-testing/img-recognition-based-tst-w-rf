*** Settings ***
Documentation    Simple test cases to check purchasing wizard
Library          SeleniumLibrary                                 implicit_wait=5    timeout=5
Resource         resources/tesla.robot
Test Setup       Start Order
Test Teardown    Close All Browsers


*** Variables ***
${start_url}    https://www.tesla.com/
${browser}      Chrome

*** Test Cases ***
TC1    # Order Blue Tesla With Auto Pilot
       Order Tesla                           Midnight Silver Metallic    19’’ Sport Wheels    Black and White    YES

TC2    # Order Red Tesla No Auto Pilot
       Order Tesla                        Red Multi-Coat    18’’ Aero Wheels    Black and White    NO