*** Settings ***
Documentation       Allows running Unit Tests through the Remote API of the Unit Test module.

Library             Collections
Library             RequestsLibrary
Resource            mendix.resource


*** Variables ***
${UNITTEST_PASSWORD}        %{TESTUSER_PASSWORD=1}
&{UNITTEST_REQUEST_BODY}    password=${UNITTEST_PASSWORD}


*** Keywords ***
Run Unit Tests
    Start Unit Tests
    Check Unit Tests Status

Start Unit Tests
    [Documentation]    Run Unit Tests through the Remote API.
    ${response}=    POST    ${APP_URL}/unittests/start    json=${UNITTEST_REQUEST_BODY}

Check Unit Tests Status
    [Documentation]    Check Unit Tests results thtough the Remote API.
    ${response}=    POST    ${APP_URL}/unittests/status    json=${UNITTEST_REQUEST_BODY}
    ${completed}=    Get From Dictionary    ${response.json()}    completed    true

    # Repeat until status is completed.
    IF    not ${completed}
        Sleep    5s
        Check Unit Tests Status
    ELSE
        # Determine the amount of failures and overall keyword success.
        ${failures}=    Get From Dictionary    ${response.json()}    failures    -1
        ${success}=    Should Be True    '${failures}'=='0'
    END