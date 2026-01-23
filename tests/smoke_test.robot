*** Settings ***
Library    Browser

*** Test Cases ***
Ouverture du navigateur
    New Browser    chromium  headless=True
    New Page    https://www.google.com
    Close Browser
