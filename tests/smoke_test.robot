*** Settings ***
Library    Browser

*** Test Cases ***
Ouverture du navigateur
    New Browser    chromium  headless=False
    New Page    https://www.google.com
    Close Browser
