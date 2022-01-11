*** Keywords ***
Check Visuals
    [Documentation]  Automatic visual check (before browser close)
    ...  IF ${screen} != exists  Create Screens  ELSE  Compare Screen

    ${width}  ${height} =   Set Variable  1366  768  # 2560  1440
    ${screen name} =        Set Variable  ${TEST NAME}-${browser}-
    ${file name} =          Set Variable  ${screen name}${width}x${height}.png
    ${path} =               Set Variable  outputs

    ${exist}  ${msg} =      Run Keyword And Ignore Error	  File Should Exist   ${path}/${file name}

    Set window size         ${width}  ${height}

    Run Keyword If          '${exist}' == 'FAIL'
    # ...  Create Screens          ${width}  ${height}  save_folder=${path}  screen_name=${TEST NAME}
    ...  Create Screens          ${width}  ${height}  save_folder=${path}  screen_name=${screen name}

    Run Keyword If          '${exist}' == 'PASS'
    ...  Compare Screen	    ${path}/${file name}  save_folder=${path}

    Close Browser
