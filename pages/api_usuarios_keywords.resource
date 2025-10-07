*** Settings ***
Library    RequestsLibrary

Resource    ../resources/api_variables.robot

*** Keywords ***
Quando faço uma requisição GET em usuários
    ${response}    GET On Session    alias=serverest    url=${endpoint_USUARIOS}
    Set Suite Variable    ${response}

Então recebo status code "${status}" e lista de usuários e quantidade
    Log    ${response}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    ${status}
    ${body}=    To Json    ${response.content}
    ${quantidade}    Get Variable Value    ${body["quantidade"]}   
    ${usuarios}    Get Variable Value    ${body["usuarios"]}  
    Log  ${quantidade}
    Log    ${usuarios}

Quando faço uma requisição POST para cadastrar um usuário
    ${payload}    Create Dictionary    nome=Eduardo Teste1    email=edu@testeqa.com    password=teste    administrador=false

    ${response}    POST On Session    alias=serverest    url=${endpoint_USUARIOS}    json=${payload}
    Set Suite Variable    ${response}

Então recebo o status code "${status}" e mensagem "${mensagem}" e id
    Should Be Equal As Integers    ${response.status_code}    ${status}
    ${body}=    To Json    ${response.content}
    Should Be Equal    ${body["message"]}    ${mensagem}
    Set Suite Variable    ${id}    ${body["_id"]}
    Log    ${id}

Quando faço uma requisição GET em usuários com o id
    ${response}    GET On Session    alias=serverest    url=${endpoint_USUARIOS}/${id}
    Set Suite Variable    ${response}

Então recebo o status code "${status}" e dados do usuário
    Should Be Equal As Integers    ${response.status_code}    ${status}
    Log    ${response.content}
    ${body}=    To Json    ${response.content}
    Should Be Equal    ${body["_id"]}    ${id}

Quando faço uma requisição PUT em um usuário cadastrado
    ${payload}    Create Dictionary    nome=Eduardo Teste1    email=edu@testeqa.com    password=teste2    administrador=false
    # ${response}    PUT On Session    alias=serverest    url=${endpoint_USUARIOS}/2TsuaE3gB0joM8HB    json=${payload}
    ${response}    PUT On Session    alias=serverest    url=${endpoint_USUARIOS}/${id}    json=${payload}
    Set Suite Variable    ${response}

Então recebo o status code "${status}" e a mensagem "${mensagem}"
    Should Be Equal As Integers    ${response.status_code}    ${status}
    ${body}=    To Json    ${response.content}
    Should Be Equal    ${body["message"]}     ${mensagem}
    Log    ${body}

Quando faço uma requisição DELETE em um usuário por id
    # ${response}    DELETE On Session    alias=serverest    url=${endpoint_USUARIOS}/2TsuaE3gB0joM8HB  
    ${response}    DELETE On Session    alias=serverest    url=${endpoint_USUARIOS}/${id}
    Set Suite Variable    ${response}
