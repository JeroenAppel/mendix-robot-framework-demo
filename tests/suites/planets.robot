*** Settings ***
Documentation       Contains Test Cases relevant to the Planets module in the Mendix application

Resource            ../resources/generic/mendix.resource
Resource            ../resources/authentication.resource

Suite Setup         Default Suite Setup
Suite Teardown      Default Suite Teardown


*** Test Cases ***
Dwarf Planets
    [Documentation]    Create two Planets without an atmosphere,
    ...    then verify the new Planet data is correctly shown to Tourists.
    ...    Delete the Planets in the TearDown of this Test Case.
    Fail

Planet X
    [Documentation]    Create a new Planet with an atmosphere,
    ...    then verify the new Planet data is correctly shown to Tourists.
    ...    Delete both the Planet and Atmospheric Elements in the TearDown of this Test Case.
    Fail

Apocalypse
    [Documentation]    Create a new Planet with an atmosphere in the Setup of the Test Case,
    ...    then verify that atmosphere components cannot be deleted.
    ...    Delete both the Planet and Atmospheric Elements in the TearDown of this Test Case.
    Fail

Captains Log
    [Documentation]    Create a new Planet without an atmosphere in the Setup of the Test Case,
    ...    then add a Captain's Log entry as an Astronaut and verify the log is visible in the user's Captain's Log,
    ...    then in the TearDown of this Test Case, delete both the Planet and the created log by running the Unit Test in the RobotTearDown module.
    ...    Note that you will need to add the text '[RobotTearDown]' as part of the Content of the Captain's Log in order to delete the log through the Unit Test.
    Fail

Grand Tour
    [Documentation]    Insert all Planets from the Excel data file in the Setup of the Test Case,
    ...    then add a Captain's Log entry as an Astronaut for each Planet and verify the logs are visible in the user's Captain's Log,
    ...    then in the TearDown of this Test Case, delete both the Planets and the created logs by running the Unit Test in the RobotTearDown module.
    ...    Note that you will need to add the text '[RobotTearDown]' as part of the Content of the Captain's Log in order to delete the log through the Unit Test.
    Fail
