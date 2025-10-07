*** Settings ***
Library    RequestsLibrary

Resource    ../resources/api_keywords.robot
Resource    ../resources/api_variables.robot
Resource    ../pages/api_login_keywords.resource

*** Test Cases ***
Cenário 01 - Login com sucesso 
    Dado que a api Serverest está disponível
    Quando envio uma requisição POST com parametros "fulano@qa.com" e "teste"
    Então vejo o status code "200" e mensagem "Login realizado com sucesso"

Cenário 02 - Email inválido
    Dado que a api Serverest está disponível
    Quando envio uma requisição POST com parametros "fulano#qa.com" e "teste"
    Então vejo o status code "400" e mensagem "email deve ser um email válido"

Cenário 03 - Email ou senha incorretos
    Dado que a api Serverest está disponível
    Quando envio uma requisição POST com parametros "fulano@qa.com" e "teste1"
    Então vejo o status code "401" e mensagem "Email e/ou senha inválidos"

Cenário 04 - Senha em branco
    Dado que a api Serverest está disponível
    Quando envio uma requisição POST com parametros "fulano@qa.com" e ""
    Então vejo o status code "400" e mensagem "password não pode ficar em branco"

Cenário 05 - Email em branco
    Dado que a api Serverest está disponível
    Quando envio uma requisição POST com parametros "" e "teste"
    Então vejo o status code "400" e mensagem "email não pode ficar em branco"