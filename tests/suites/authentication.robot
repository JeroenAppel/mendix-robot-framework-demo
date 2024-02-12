*** Settings ***
Documentation       Verifies that the TestUser_ syntax for authentication is working for each UserRole.

Resource            ../resources/generic/mendix.resource
Resource            ../resources/authentication.resource

Suite Setup         Default Suite Setup
Suite Teardown      Default Suite Teardown


*** Test Cases ***
Authenticate as SysAdmin
    [Documentation]    Authenticate with the SysAdmin TestUser.
    [Setup]    Login with UserRole    SysAdmin
    [Teardown]    Logout
    Log    Logged in as SysAdmin

Authenticate as Q
    [Documentation]    Authenticate with the Q TestUser.
    [Setup]    Login with UserRole    Q
    [Teardown]    Logout
    Log    Logged in as Q

Authenticate as Astronaut
    [Documentation]    Authenticate with the Astronaut TestUser.
    [Setup]    Login with UserRole    Astronaut
    [Teardown]    Logout
    Log    Logged in as Astronaut
