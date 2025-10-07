*** Settings ***
Library    RequestsLibrary

Resource    ../resources/api_variables.robot

*** Keywords ***
Quando envio uma requisição POST com parametros "${email}" e "${senha}"
    ${payload}    Create Dictionary    email=${email}    password=${senha}
    ${response}    Run Keyword And Continue On Failure    POST On Session    alias=serverest    url=${ENDPOINT_LOGIN}    json=${payload}    expected_status=any
    Set Suite Variable    ${response}

Então vejo o status code "${status}" e mensagem "${msg_retorno}"
    Should Be Equal As Integers    ${response.status_code}    ${status}
    ${body}=    To Json    ${response.content}

    IF    ${status} == 200
        Should Be Equal    ${body["message"]}    ${msg_retorno}
        Set Suite Variable    ${token}    ${body["authorization"]}
        Log    ${token}
    ELSE IF  ${status} == 400
        Run Keyword And Ignore Error    Should Be Equal    ${body["email"]}    ${msg_retorno}
        Run Keyword And Ignore Error    Should Be Equal    ${body["password"]}    ${msg_retorno}
    ELSE IF  ${status} == 401
        Should Be Equal    ${body["message"]}    ${msg_retorno}
    END