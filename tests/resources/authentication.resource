*** Settings ***
Documentation       Allows login through Accounts created with the TestUser_{UserRole} syntax for each application-level UserRole.

Resource            generic/mendix.resource


*** Variables ***
${LOGOUT_LOCATOR}       mx=signOutButton
${LOGIN_URL}            ${APP_URL}/login.html
${TESTUSER_PASSWORD}    %{TESTUSER_PASSWORD=DevOps2024!}


*** Keywords ***
Login with UserRole
    [Documentation]    Authenticate with an Account based on the name of its UserRole.
    [Arguments]    ${userrole}

    # TestUsers are created in the runtime using the syntax TestUser_{UserRole}. The username generated here should match the value in Mendix to prevent a username mismatch.
    ${username}=    Catenate    SEPARATOR=_    TestUser    ${userrole}

    # Execute the Login keyword with the username and password values for the generated TestUser
    Login    ${username}    $TESTUSER_PASSWORD

Login
    [Documentation]    Authenticate with an Account, given its username and password.
    [Arguments]    ${username}    ${password}

    # Navigate to the Login page
    Go to Mendix Page    login
    Wait Until Network Is Idle

    Fill Text    mx=loginIdTextBox >> input    ${username}
    Fill Secret    mx=passwordTextBox >> input    ${password}

    ${login_btn}=    Get Element    mx=signInButton
    Click    ${login_btn}
    Wait For Elements State    ${login_btn}    detached    timeout=5s

Logout
    [Documentation]    Logout from the current Mendix application.
    ${logout_btn}=    Get Element    css=.mx-navbar-item >> a[title='Logout']
    Click    ${logout_btn}
    Wait For Elements State    ${logout_btn}    detached    timeout=5s
