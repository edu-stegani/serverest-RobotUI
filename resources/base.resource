*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem

Resource    global-variables.robot

*** Keywords ***
Abrir navegador e acessar sistema modo "${modo}"
    IF  "${modo}" == "headless"
        Open Browser    ${login-url}    headlesschrome    options=add_argument("--window-size=1920,1080")
    ELSE IF  "${modo}" == "local"
        Open Browser    ${login-url}    chrome
        Maximize Browser Window
    END
    Wait Until Element Is Visible    xpath=${form-login}
    Criar Diretorio Evidencias

E clico no botão "${nameButton}"
    Wait Until Element Is Visible    xpath=//button[contains(.,'${nameButton}')]    15
    Click Button    xpath=//button[contains(.,'${nameButton}')]

Criar Diretorio Evidencias
    ${dataAtual}    Get Current Date    result_format=%d-%m-%Y
    Set Global Variable    ${dataAtual}
    Create Directory    ${EXECDIR}\\results\\${SUITE_NAME}\\${dataAtual}
    Set Screenshot Directory    ${EXECDIR}\\results\\${SUITE_NAME}\\${dataAtual}

Tirar Print com TestName
    Capture Page Screenshot    ${TEST_NAME}-{index}.png

Então vejo a mensagem "${mensagem}"
    Wait Until Page Contains    text=${mensagem}    timeout=15s
    Tirar Print com TestName