*** Settings ***
Library    Browser

*** Keywords ***
Open Application And Login
    New Browser    chromium    headless=True
    New Context
    New Page    https://opensource-demo.orangehrmlive.com/

    Fill Text    input[name="username"]    Admin
    Fill Text    input[name="password"]    admin123
    Click        button[type="submit"]

    Wait For Elements State    css=span.oxd-main-menu-item--name >> text=Leave    visible    timeout=20s
