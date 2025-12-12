*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem
Library    Collections

Resource    global-variables.robot

*** Variables ***
${HEADLESS}    true
@{CHROME_ARGS}    --no-sandbox    --disable-dev-shm-usage    --disable-gpu

*** Keywords ***
Abrir navegador e acessar sistema
    IF    '${HEADLESS}' == 'true'
        Append To List    ${CHROME_ARGS}    --headless=new
    END
    ${options}=    Create Dictionary    args=${CHROME_ARGS}
    Open Browser    ${login-url}    chrome    options=${options}
    Maximize Browser Window
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
    Wait Until Page Contains    text=${mensagem}
    Tirar Print com TestName