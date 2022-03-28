*** Variables ***
# to be provided by:
# SAUCE_USERNAME & SAUCE_ACCESS_KEY taken from system environment variables
#
# ${REMOTE URL}       https://%{SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.eu-central-1.saucelabs.com:443/wd/hub

${OS}               Windows 10
${VERSION}          latest


*** Keywords ***
Open Remote Browser
    [Documentation]         New start browser in sauce labs
    [Arguments]  ${url}  ${browser name}

    ${configuration}        create dictionary
    ...  name=tst:${OS}/${browser name}/${VERSION}
    ...  browserName=${browser name}
    ...  platform=${OS}
    ...  browserVersion=${VERSION}
    ...  username=%{SAUCE_USERNAME}
    ...  accessKey=%{SAUCE_ACCESS_KEY}
    ...  screenResolution=1600x1200

    Open Browser                ${url}    ${browser name}
    ...                         remote_url=${REMOTE URL}
    ...                         desired_capabilities=${configuration}
