*** Settings ***
Library    RequestsLibrary

Resource    ../resources/base.resource

*** Keywords ***
Cadastrar Usuario na Api
    Create Session    alias=serverest    url=${BASE_URL}    disable_warnings=${True}

    ${payload}    Create Dictionary    nome=edu teste    email=edu@teste.com    password=senhaforte1    administrador=false
    ${response}    POST On Session    alias=serverest    url=${endpoint_USUARIOS}    json=${payload}    expected_status=any
    Set Suite Variable    ${response}

    Should Be Equal As Integers    ${response.status_code}    201
    ${body}=    To Json    ${response.content}
    Should Be Equal    ${body["message"]}    Cadastro realizado com sucesso
    Set Suite Variable    ${id}    ${body["_id"]}
    Log    ${id}

Autenticação Adm
    Create Session    alias=serverest    url=${BASE_URL}    disable_warnings=${True}
    ${payload}    Create Dictionary    email=fulano@qa.com    password=teste
    ${response}    POST On Session    alias=serverest    url=${ENDPOINT_LOGIN}    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    To Json    ${response.content}
    ${token}    Get Variable Value   ${body["authorization"]}
    Set Global Variable    ${token}    