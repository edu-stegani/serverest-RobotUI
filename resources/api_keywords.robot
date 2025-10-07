*** Settings ***
Library    RequestsLibrary

Resource    ../resources/api_variables.robot

*** Keywords ***
Dado que a api Serverest está disponível
    Create Session    alias=serverest    url=${BASE_URL}    disable_warnings=${True}

Autenticação 
    Create Session    alias=serverest    url=${BASE_URL}    disable_warnings=${True}
    ${payload}    Create Dictionary    email=fulano@qa.com    password=teste
    ${response}    POST On Session    alias=serverest    url=${ENDPOINT_LOGIN}    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    To Json    ${response.content}
    ${token}    Get Variable Value   ${body["authorization"]}
    Set Global Variable    ${token}    