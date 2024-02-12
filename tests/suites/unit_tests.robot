*** Settings ***
Documentation       Runs the Unit Tests exposed by the Remote API of the Unit Test module.

Resource            ../resources/generic/unittest.resource

*** Test Cases ***
Run Unit Tests through Remote API
    [Documentation]    Runs the Unit Tests belonging to this Mendix application.
    Run Unit Tests
