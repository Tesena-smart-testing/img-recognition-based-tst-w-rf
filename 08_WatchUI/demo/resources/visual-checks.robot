*** Keywords ***
Check Visuals
    [Documentation]    Automatic visual check (before browser close)
    ...                IF ${screen} != exists                           Create Screens    ELSE    Compare Screen

    ${width}            ${height} =     Set Variable                                  1366    768    # 2560    1440
    ${screen name} =    Set Variable    ${TEST NAME}-${browser}-${width}x${height}
    ${file name} =      Set Variable    ${screen name}.png
    ${path} =           Set Variable    outputs

    ${exist}          ${msg} =    Run Keyword And Ignore Error    File Should Exist    ${path}/${file name}
    Log To Console    ${msg}

    Set window size    ${width}    ${height}

    Sleep    2s    # TODO: Improve in future

    Run Keyword If    '${exist}' == 'FAIL'
    ...               Create new baseline     ${width}    ${height}    ${path}    ${screen name}

    Run Keyword If    '${exist}' == 'PASS'
    ...               Compare Screen          ${path}/${file name}    save_folder=${path}    # ssim=0.9

    Close Browser


Create new baseline
    [Arguments]       ${width}                                                                                                               ${height}    ${path}                ${screen name}
    Create Screens    ${width}                                                                                                               ${height}    save_folder=${path}    screen_name=${screen name}
    Skip              Baseline file doesn't exist creating new baseline: ${width} x ${height}, path: ${path}, screen name: ${screen name}
