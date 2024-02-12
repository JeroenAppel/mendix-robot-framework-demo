*** Settings ***
Documentation       Useful generic Keywords for testing Mendix applications.

Library             BuiltIn
Library             Browser    jsextension=${CURDIR}/extensions/mendixSelector.js


*** Variables ***
${APP_URL}          %{APP_HOST=http://localhost:8080}
${BROWSER}          %{BROWSER=Chromium}
${HEADLESS_MODE}    %{HEADLESS_MODE=false}
${VIEWPORT}         %{VIEWPORT={'width': 1920, 'height': 1080}}


*** Keywords ***
Default Suite Setup
    [Documentation]    Default Suite Setup for Mendix applications.
    Start Default Browser
    Register Mendix Selector
    New Page

Default Suite Teardown
    [Documentation]    Default Suite Teardown for Mendix applications.
    Close Browser

Start Default Browser
    [Documentation]    Starts both a new browser and context with default parameters, for convenience.
    New Browser    ${BROWSER}    headless=${HEADLESS_MODE}
    New Context    viewport=${VIEWPORT}    acceptDownloads=True

Open App
    [Documentation]    Navigates to the default page for the currentUser.
    Go To    ${APP_URL}

Click and Wait
    [Documentation]    Click element and wait until network is idle.
    [Arguments]    ${selector}
    Click    ${selector}
    Wait Until Network Is Idle

Go to Mendix Page
    [Documentation]    Opens a named path (i.e. page) of a Mendix application using it's path, i.e. providing 'planets/Mars' would navigate to ${APP_URL}/p/planets/Mars. Does not work for Microflows.
    [Arguments]    ${path}
    Go To    ${APP_URL}/p/${path}
    Wait For Navigation    ${APP_URL}/p/${path}
    Wait Until Network Is Idle

Get Modal Container
    [Documentation]    Gets the Modal Container for given title. Useful when you want to constrain your search for child elements to the modal container.
    [Arguments]    ${title}
    ${container}=    Get Element    xpath=(//div[./div[contains(@class, 'modal-header') and contains(./h4//text(), '${title}')]])[1]
    RETURN    ${container}

Close Modal
    [Documentation]    Closes the Modal Container for the given title using the specified action-element.
    [Arguments]    ${title}    ${action}
    ${container}=    Get Modal Container    ${title}
    Click and Wait    ${container} >> ${action}

Dismiss Modal
    [Documentation]    Closes the Modal Container for the given title using the close-icon the in the modal header.
    [Arguments]    ${title}
    Close Modal    ${title}    .modal-header > .close
