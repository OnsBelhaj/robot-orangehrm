*** Settings ***
Library    Browser

*** Test Cases ***
Soumettre une demande de congé valide
    New Browser    chromium    headless=False
    New Context
    New Page    https://opensource-demo.orangehrmlive.com/

    Fill Text    input[name="username"]    Admin
    Fill Text    input[name="password"]    admin123
    Click        button[type="submit"]

    Wait For Elements State    css=nav.oxd-navbar-nav    visible    timeout=15s
    Click        css=span.oxd-main-menu-item--name >> text=Leave


    Wait For Elements State    text=Apply    visible    timeout=15s
    Wait For Elements State    css=button.oxd-button--secondary    visible    timeout=15s
    Click        text=Apply

    Wait For Elements State    css=div.oxd-select-text    visible    timeout=15s
    Click        css=div.oxd-select-text

    Wait For Elements State    text=CAN - Vacation    visible    timeout=15s
    Click        text=CAN - Vacation

    Fill Text    input[placeholder="yyyy-mm-dd"]    2026-02-10
    Fill Text    input[placeholder="yyyy-mm-dd"]    2026-02-12
    Click       button[type="submit"]


    Close Browser
