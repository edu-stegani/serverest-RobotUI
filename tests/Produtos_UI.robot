*** Settings ***
Resource    ../resources/base.resource
Resource    ../pages/loginPage.resource
Resource    ../pages/produtosPage.resource
Resource    ../pages/requests_api.resource

Suite Setup    Run Keywords
...    Abrir navegador e acessar sistema
...    Cadastrar Usuario na Api
Test Setup    Fazer login    ${payload.email}    ${payload.password}
Test Teardown    Logout
Suite Teardown    Close All Browsers

*** Test Cases ***
Cenario 01 - Pesquisar produto não cadastrado
    Dado que estou na dashboard serverest
    Quando pesquiso por um produto não cadastrado
    Então vejo a mensagem "Nenhum produto foi encontrado"

Cenario 02 - Pesquisar produto cadastrado
    Dado que estou na dashboard serverest
    Quando pesquiso por um produto cadastrado
    Então vejo o card do produto na lista

Cenario 03 - Adicionar produto a lista
    Dado que estou na dashboard serverest
    Quando pesquiso por um produto cadastrado
    E clico no botão "Adicionar a lista"
    Então vejo a lista de compras com o produto

Cenario 04 - Adicionar produto ao carrinho 
    Dado que estou na dashboard serverest
    Quando pesquiso por um produto cadastrado
    E clico no botão "Adicionar a lista"
    E clico no botão "Adicionar no carrinho"
    Então sou redirecionado a page carrinho

Cenario 05 - Limpar lista 
    Dado que estou na dashboard serverest
    Quando pesquiso por um produto cadastrado
    E clico no botão "Adicionar a lista"
    E clico no botão "Limpar Lista"
    Então vejo a mensagem "Seu carrinho está vazio"
