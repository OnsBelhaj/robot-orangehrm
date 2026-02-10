*** Settings ***
Library    Browser
Resource   variables.robot

*** Keywords ***
Open Application And Login
    New Browser    ${BROWSER}    headless=True
    New Context
    New Page    ${URL}

    Fill Text    input[name="username"]    ${USERNAME}
    Fill Text    input[name="password"]    ${PASSWORD}
    Click        button[type="submit"]

    Wait For Elements State
    ...    css=span.oxd-main-menu-item--name >> text=Leave
    ...    visible
    Click    css=span.oxd-main-menu-item--name >> text=Leave

Go To Apply Leave
    Wait For Elements State    text=Apply    visible
    Click    text=Apply

Close Application
    Close Browser
