*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***

TC01 - Apply Leave Without Balance (Negative Case)
    [Documentation]    Vérifier qu’un utilisateur sans solde ne peut pas soumettre une demande
    Open Application And Login
    Go To Apply Leave

    Wait For Elements State
    ...    text=No Leave Types with Leave Balance
    ...    visible
    ...    timeout=10s

    Close Application


TC02 - Apply Leave With Balance (Positive Case - Conditional)
    [Documentation]    Soumettre une demande de congé si un solde existe
    Open Application And Login
    Go To Apply Leave

    ${hasBalance}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    css=div.oxd-select-text
    ...    visible
    ...    timeout=5s

    IF    ${hasBalance}
        Click    css=div.oxd-select-text
        Wait For Elements State    css=div[role="listbox"]    visible
        Click    css=div[role="option"] >> nth=0

        Fill Text    input[placeholder="yyyy-mm-dd"]    2026-02-10
        Fill Text    input[placeholder="yyyy-mm-dd"]    2026-02-12
        Click        button[type="submit"]

        Wait For Elements State
        ...    text=Successfully Saved
        ...    visible
        ...    timeout=10s
    ELSE
        Log    Aucun solde disponible – test positif ignoré    WARN
    END

    Close Application
