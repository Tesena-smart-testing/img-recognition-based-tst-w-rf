*** Keywords ***
Order Tesla
    [Documentation]     Test Order Tesla as per defined parameters
    [Arguments]         ${color}  ${wheel type}  ${int color}  ${autopilot}
    # select payment options & drive type
    Click Button    Next  # 1. Car > 2. Exterior

    Select Exterior Options  ${color}  ${wheel type}
    Click Button    Next  # 2. Exterior > 3. Interior

    Select Interior Options  ${int color}
    Click Button    Next  # 3. Interior > 4. Autopilot

    Select Autopilot Options  ${autopilot}
    Click Button    Next  # 4. Autopilot > 5. Payment

    Input Text      id=FIRST_NAME  Marcel

    # Fill out all the other fields about customer
    # Click Button    Place Order  # Place Order

Select Exterior Options
    [Documentation]     Set up paramteters in Exterior Options section
    ...  Possible options:
    ...  - Color
    ...    1. Pearl White Multi-Coat
    ...    2. Solid Black
    ...    3. Midnight Silver Metallic
    ...    4. Deep Blue Metallic
    ...    5. Red Multi-Coat
    ...  - Wheel type
    ...    1. 18’’ Aero Wheels
    ...    2. 19’’ Sport Wheels
    [Arguments]         ${color}  ${wheel type}
    Click Element       //div[@aria-label='${color}']
    Click Element       //div[@aria-label='${wheel type}']

Select Interior Options
    [Documentation]     Set up paramteters in Interior Options section
    ...  Possible options:
    ...  1. All Black > $IN3B2
    ...  2. Black and White > $IN3BW
    [Arguments]         ${color}
    Click Element       //div[@data-id='${color}']

Select Autopilot Options
    [Documentation]     Set up paramteters in Autopilot section
    ...  Possible options:
    ...  1. YES
    ...  2. NO
    [Arguments]         ${autopilot}
    Run Keyword If      '${autopilot}' == 'YES'  Click Element
    ...  //div[@aria-label='Full Self-Driving Capability' and @class='group--options_card--checkbox--container']

Click Link If Exists
    [Documentation]     Check whether element is visible befor clicking
    [Arguments]         ${locator}
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   link=${locator}
    Run Keyword If    ${present}    Click Link      ${locator}


Start Order
    [Documentation]  Set up keyword for each test
    Set Selenium Speed  .2 second  # slow down for demo

    Open Browser    ${start_url}      ${browser}
    # Open Remote Browser    ${start_url}      ${browser}
    Maximize Browser Window

    Click Link If Exists    Change Language
    Click Link If Exists    United States

    Click Link      Model 3
    Click Link      Order Now

