# Mendix Robot Framework Demo

This demo is based on a fictional application called "Solar System Explorer" and demonstrates the use of Robot Framework and Playwright for UI test automation in Mendix applications.

## System Requirements
- Python 3.8 or newer is supported.
- NodeJS 18 and 20 LTS versions are supported.
- Mendix 10.6.2 (tested) or newer (untested) are supported.
- VSCode + extention for [VSCode Robot Framework Language server](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp).

## Installation Instructions
- Install node.js e.g. from https://nodejs.org/en/download/
- Update pip ```pip install -U pip``` to ensure latest version is used
- Install robotframework-browser from the commandline: ```pip install robotframework-browser```
- Install the node dependencies: run ```rfbrowser init``` in your shell
    - If rfbrowser is not found, try python -m Browser.entry init
Check if Robotframework is working: https://github.com/MarketSquare/robotframework-browser?tab=readme-ov-file#testing-with-robot-framework

## Getting Started
Ensure the Mendix application is running on localhost:8080 with the default Settings configuration. This will automatically create TestUsers using the custom Administration module included in the application.

The default credentials for these test users are:

Username | Password
---|---
TestUser_Astronaut | DevOps2024!
TestUser_Q | DevOps2024!
TestUser_SysAdmin | DevOps2024!
MxAdmin | 1

All workshop exercises are found in the ```.robot```files in the ```./tests/suites``` folder relative to the root directory of the repository.

## Useful Information
- Each test run creates a Session in the Mendix application. When ran locally, Mendix applications only have a limited set of Sessions available for use. Sessions of users who are not logged in are automatically deleted by the application in this workshop, however sessions of logged-in users can only be deleted manually from the session management page available to MxAdmin.
