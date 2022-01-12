*** Settings ***
# Exercise: Define Documentation and Library
Library          Process
Library          OperatingSystem

*** Variables ***
# Exercise: Define image directory ${IMAGE_DIR}

*** Test Cases ***
Calculator Test
    Open Calculator

    # Exercise 1: Write test to calculate 
    # 1 + 2 using standard calculator.

    # Exercise 2: Write test to calculate 
    # 4 - 3 using scientific calculator.

    # Exercise 3: Write test to calculate 
    # 5 * 6 using programmer calculator.

    # Exercise 4: Write test to calculate 
    # 8 / 7 using scientific calculator.
    
*** Keywords ***
Open Calculator
    Run Process      calc.exe

# ==============================
# Some more details here:
# ==============================
#    Sikuli library: http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html


