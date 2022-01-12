*** Keywords ***
Order Tesla
    [Documentation]    Test Order Tesla as per defined parameters
    [Arguments]        ${color}                                      ${wheel type}    ${int color}    ${autopilot}

    Set Language    English

    Select Exterior Options    ${color}    ${wheel type}

    Select Interior Options    ${int color}

    Select Autopilot Options    ${autopilot}

    Click Button    Continue to payment

    # For demo purpose this is enough. In real scenario we'd proceed with payment.

Select Exterior Options
    [Documentation]    Set up paramteters in Exterior Options section
    ...                Possible options:
    ...                - Color
    ...                1. Pearl White Multi-Coat
    ...                2. Solid Black
    ...                3. Midnight Silver Metallic
    ...                4. Deep Blue Metallic
    ...                5. Red Multi-Coat
    ...                - Wheel type
    ...                1. 18’’ Aero Wheels
    ...                2. 19’’ Sport Wheels
    [Arguments]        ${color}                                          ${wheel type}

    Scroll Element Into View    //div[@data-group-id='PAINT']
    Click Element               //input[contains(@aria-label, "${color}")]/following-sibling::label

    Scroll Element Into View    //div[@data-group-id='WHEELS']
    Click Element               //input[contains(@aria-label, '${wheel type}')]/following-sibling::label

Select Interior Options
    [Documentation]             Set up paramteters in Interior Options section
    ...                         Possible options:
    ...                         1. All Black
    ...                         2. Black and White
    [Arguments]                 ${color}
    Scroll Element Into View    //div[@data-group-id='PACKAGES']
    Click Element               //input[contains(@aria-label, '${color}')]/following-sibling::label

Select Autopilot Options
    [Documentation]             Set up paramteters in Autopilot section
    ...                         Possible options:
    ...                         1. YES
    ...                         2. NO
    [Arguments]                 ${autopilot}
    Scroll Element Into View    //div[@data-group-id='AUTOPILOT_PACKAGE']
    Run Keyword If              '${autopilot}' == 'YES'                                                            Click Element
    ...                         //button[contains(@aria-label, 'Select Option - Full Self-Driving Capability')]

Click Link If Exists
    [Documentation]    Check whether element is visible befor clicking
    [Arguments]        ${locator}
    ${present}=        Run Keyword And Return Status                      Element Should Be Visible    link=${locator}
    Run Keyword If     ${present}                                         Click Link                   ${locator}


Set Language
    [Arguments]             ${language}=English
    Click Element           id:locale-selector-trigger
    Click Link If Exists    English                       # Assumption: If link does not exist, it is already selected

Start Order
    [Documentation]    Set up keyword for each test
    # Set Selenium Speed    .2 second                       # slow down for demo

    Open Browser    ${start_url}    ${browser}
    # Open Remote Browser    ${start_url}      ${browser}
    # Maximize Browser Window

    # Hack for demo - use the secondary screen
    Set Window Position    -1900    -130
    Set Window Size        1900     1000

    Click Link If Exists    Change Language
    Click Link If Exists    United States

    Click Link       Model 3
    Click Element    //a[@title = "Order Now"]

