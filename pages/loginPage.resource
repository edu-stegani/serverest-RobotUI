*** Settings ***
Library    SeleniumLibrary

Resource    ../resources/base.resource

*** Keywords ***
Fazer login
    [Arguments]    ${email}    ${password}    
    Dado que estou na page login Serverest
    Quando preencho os dados com "${email}" e "${password}"
    E clico no botão "Entrar"
    Wait Until Element Is Visible    xpath=${campoPesquisar}

Logout
    E clico no botão "Logout"
    Location Should Be    url=${login-url}

Dado que estou na page login Serverest
    Element Should Be Visible    css=#email
    Element Should Be Visible    css=#password

Quando preencho os campos com email e senha válidos
    Input Text    css=#email    ${emailCadastrado}
    Input Password    css=#password    ${senhaCadastrada}

Quando preencho os dados com "${email}" e "${password}"
    Input Text    css=#email    ${email}
    Input Password    css=#password    ${password}
    Set Global Variable    ${email}

Então sou redirecionado a dashboard
    Wait Until Element Is Visible    xpath=${campoPesquisar}
    Tirar Print com TestName
