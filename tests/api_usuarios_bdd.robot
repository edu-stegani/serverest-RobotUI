*** Settings ***
Library    RequestsLibrary

Resource    ../resources/api_keywords.robot
Resource    ../resources/api_variables.robot
Resource    ../pages/api_usuarios_keywords.resource

*** Test Cases ***
Cenário 01 - Buscar todos usuários
    Dado que a api Serverest está disponível
    Quando faço uma requisição GET em usuários
    Então recebo status code "200" e lista de usuários e quantidade

Cenário 02 - Cadastro de usuário
    Dado que a api Serverest está disponível
    Quando faço uma requisição POST para cadastrar um usuário
    Então recebo o status code "201" e mensagem "Cadastro realizado com sucesso" e id

Cenário 03 - Busca de usuário por id
    Dado que a api Serverest está disponível
    Quando faço uma requisição GET em usuários com o id
    Então recebo o status code "200" e dados do usuário

Cenário 04 - Alteração de dados do usuário
    Dado que a api Serverest está disponível
    Quando faço uma requisição PUT em um usuário cadastrado
    Então recebo o status code "200" e a mensagem "Registro alterado com sucesso"

Cenário 05 - Excluir usuário 
    Dado que a api Serverest está disponível
    Quando faço uma requisição DELETE em um usuário por id
    Então recebo o status code "200" e a mensagem "Registro excluído com sucesso"
