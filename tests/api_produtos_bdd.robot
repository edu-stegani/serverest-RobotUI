*** Settings ***
Library    RequestsLibrary

Resource    ../resources/api_keywords.robot
Resource    ../resources/api_variables.robot
Resource    ../pages/api_produtos_keywords.resource
 
Suite Setup    Autenticação

*** Test Cases ***
Cenário 01 - Buscar todos produtos
    Dado que a api Serverest está disponível
    Quando faço uma requisição GET na api de produtos
    Então recebo status code "200" e lista de produtos e quantidade

Cenário 02 - Cadastrar produto com autenticação
    Dado que a api Serverest está disponível
    Quando faço uma requisição POST na api produtos com autenticação
    Então recebo o status code "201" e mensagem "Cadastro realizado com sucesso" e id do produto

Cenário 03 - Buscar produto por id
    Dado que a api Serverest está disponível
    Quando faço uma requisição GET em produtos por id
    Então recebo o status code "200" e informações do produto

Cenário 04 - Editar produto 
    Dado que a api Serverest está disponível
    Quando faço um requisição PUT em produtos 
    Então recebo o satus code "200" e mensagem "Registro alterado com sucesso"

Cenário 05 - Excluir produto
    Dado que a api Serverest está disponível
    Quando faço um requisição DELETE em produtos
    Então recebo o satus code "200" e mensagem "Registro excluído com sucesso"

Cenário 06 - Buscar produto excluído
    Dado que a api Serverest está disponível
    Quando faço uma requisição GET em produtos por id
    Então recebo o satus code "400" e mensagem "Produto não encontrado"
