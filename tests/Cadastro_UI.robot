*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

Suite Setup    Abrir navegador e acessar sistema modo "headless"
Suite Teardown    Close All Browsers

Resource    ../resources/base.resource
Resource    ../pages/cadastroPage.resource

*** Test Cases ***
Cenario - Cadastro com sucesso
    [Tags]    test
    [Teardown]    Logout
    Dado que estou na page cadastro Serverest
    Quando preencho os campos "nome", "email" e "password"
    E clico no botão "Cadastrar"
    Então vejo a mensagem "Cadastro realizado com sucesso"

Cenario - Nome em branco
    Dado que estou na page cadastro Serverest
    Quando preencho os campos com excessão de "nome"
    E clico no botão "Cadastrar"
    Então vejo a mensagem "Nome é obrigatório"

Cenario - Email em branco
    Dado que estou na page cadastro Serverest
    Quando preencho os campos com excessão de "email"
    E clico no botão "Cadastrar"
    Então vejo a mensagem "Email é obrigatório"

Cenario - Senha em branco
    Dado que estou na page cadastro Serverest
    Quando preencho os campos com excessão de "password"
    E clico no botão "Cadastrar"
    Então vejo a mensagem "Password é obrigatório"

Cenario - Email Ja Utilizado
    [Setup]    Cadastrar Usuario na Api
    Dado que estou na page cadastro Serverest
    Quando preencho os campos com email já cadastrado
    E clico no botão "Cadastrar"
    Então vejo a mensagem "Este email já está sendo usado"

