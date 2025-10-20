*** Settings ***

Suite Setup    Abrir navegador e acessar sistema
Suite Teardown    Close All Browsers

Resource    ../resources/base.resource
Resource    ../pages/loginPage.resource

*** Test Cases ***
Cenario 01 - Login com sucesso
    [Teardown]    Logout
    Dado que estou na page login Serverest
    Quando preencho os dados com "edu@teste.com" e "senhaforte1"
    E clico no botão "Entrar"
    Então sou redirecionado a dashboard

Cenario 02 - Senha em branco
    Dado que estou na page login Serverest
    Quando preencho os dados com "edu@teste.com" e "${EMPTY}"
    E clico no botão "Entrar"
    Então vejo a mensagem "Password é obrigatório"

Cenario 03 - Email em branco
    Dado que estou na page login Serverest
    Quando preencho os dados com "${EMPTY}" e "teste123"
    E clico no botão "Entrar"
    Então vejo a mensagem "Email é obrigatório"

Cenario 04 - Usuario não cadastrado
    Dado que estou na page login Serverest
    Quando preencho os dados com "edu@uol.com.br" e "teste123"
    E clico no botão "Entrar"
    Então vejo a mensagem "Email e/ou senha inválidos"

# Cenario 05 - Email inválido
#     [Tags]    test
#     Dado que estou na page login Serverest
#     Quando preencho os dados com "edu#teste.com" e "senhaforte1"
#     E clico no botão "Entrar"
#     Então vejo o alerta "Inclua um "@" no endereço de e-mail."
