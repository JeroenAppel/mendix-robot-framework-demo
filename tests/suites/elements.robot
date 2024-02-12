*** Settings ***
Documentation       Contains Test Cases relevant to the Elements module in the Mendix application

Resource            ../resources/generic/mendix.resource
Resource            ../resources/authentication.resource

Suite Setup         Default Suite Setup
Suite Teardown      Default Suite Teardown


*** Test Cases ***
Elementary
    [Documentation]    Insert a new Element,
    ...    verify Tourists can see the Element,
    ...    then delete the Element in the TearDown.
    Fail

Alchemy
    [Documentation]    Insert a new Element,
    ...    verify Tourists can see the Element,
    ...    edit the Element and change its name,
    ...    verify Tourists can see the Element with the changed name,
    ...    then delete the Element in the TearDown.
    Fail
