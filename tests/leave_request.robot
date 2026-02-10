*** Settings ***
Library    Browser

*** Test Cases ***
Soumettre une demande de congé valide
    New Browser    chromium    headless=True
    New Context
    New Page    https://opensource-demo.orangehrmlive.com/

    # Login
    Fill Text    input[name="username"]    Admin
    Fill Text    input[name="password"]    admin123
    Click        button[type="submit"]

    # Go to Leave
    Wait For Elements State    css=span.oxd-main-menu-item--name >> text=Leave    visible    timeout=20s
    Click                     css=span.oxd-main-menu-item--name >> text=Leave

    # Click Apply
    Wait For Elements State    text=Apply    visible    timeout=15s
    Click                     text=Apply

    # Open Leave Type dropdown
    Wait For Elements State    css=div.oxd-select-text    visible    timeout=15s
    Click                      css=div.oxd-select-text

    # Wait for dropdown list (IMPORTANT)
    Wait For Elements State    css=div.oxd-select-dropdown    visible    timeout=15s

    # Select Leave Type
    Click    css=div.oxd-select-dropdown >> text=CAN - Vacation

    # Fill dates
    Fill Text    xpath=(//input[@placeholder="yyyy-mm-dd"])[1]    2026-02-10
    Fill Text    xpath=(//input[@placeholder="yyyy-mm-dd"])[2]    2026-02-12

    # Submit
    Click    button[type="submit"]

    Close Browser
