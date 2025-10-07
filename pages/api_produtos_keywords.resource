*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary
Library    Collections

Resource    ../resources/api_variables.robot
Resource    ../resources/api_keywords.robot

*** Keywords ***
Quando faço uma requisição GET na api de produtos
    ${response}    GET On Session    alias=serverest    url=${endpoint_USUARIOS}
    Set Suite Variable    ${response}

Então recebo status code "${status}" e lista de produtos e quantidade
    Log    ${response}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    ${status}
    ${body}=    To Json    ${response.content}
    ${quantidade}    Get Variable Value    ${body["quantidade"]}   
    ${usuarios}    Get Variable Value    ${body["produtos"]}  
    Log  ${quantidade}
    Log    ${usuarios}

Quando faço uma requisição POST na api produtos com autenticação
    Log to console    Token gerado: ${token}

    # produto fixo, não muda e quebra a automação se rodar mais de uma vez
    # ${payload}    Create Dictionary    nome=Placa de vídeo GTX1000    preco=1190    descricao=Hardware    quantidade=11

    
    ${nome_produto}=    Word
    ${preco}=           Evaluate    random.randint(100, 2000)    modules=random
    ${descricao}=       Word
    ${quantidade}=      Evaluate    random.randint(1, 50)    modules=random

    ${payload}    Create Dictionary
    ...    nome=${nome_produto}
    ...    preco=${preco}
    ...    descricao=${descricao}
    ...    quantidade=${quantidade}

    ${auth}=    Create Dictionary    Authorization=${token}
    ${response}    POST On Session    alias=serverest    url=${endpoint_PRODUTOS}    headers=${auth}    json=${payload}    expected_status=any
    Set Suite Variable    ${response}

Então recebo o status code "${status}" e mensagem "${mensagem}" e id do produto
    Should Be Equal As Integers    ${response.status_code}    ${status}
    ${body}=   To Json   ${response.content}
    Should Be Equal    ${body["message"]}    ${mensagem}
    Set Suite Variable    ${id}    ${body["_id"]}

Quando faço uma requisição GET em produtos por id
    ${response}    GET On Session    alias=serverest    url=${endpoint_PRODUTOS}/${id}    expected_status=any
    Set Suite Variable    ${response}

Então recebo o status code "${status}" e informações do produto
    Should Be Equal As Integers    ${response.status_code}    ${status}
    Log    ${response.content}
    ${body}=    To Json    ${response.content}
    Should Be Equal    ${body["_id"]}    ${id}

Quando faço um requisição PUT em produtos 
    ${payload}    Create Dictionary    nome=ProdutoAlterado    preco=1000    descricao=reqPUT    quantidade=10
    ${auth}=    Create Dictionary    Authorization=${token}
    ${response}    PUT On Session    alias=serverest    url=${endpoint_PRODUTOS}/${id}    headers=${auth}    json=${payload}
    Set Suite Variable    ${response}

Então recebo o satus code "${status}" e mensagem "${mensagem}"
    Should Be Equal As Integers    ${response.status_code}    ${status}
    ${body}=    To Json    ${response.content}
    Should Be Equal    ${body["message"]}     ${mensagem}
    Log    ${body}

Quando faço um requisição DELETE em produtos
    ${auth}=    Create Dictionary    Authorization=${token}
    ${response}    DELETE On Session    alias=serverest    url=${endpoint_PRODUTOS}/${id}    headers=${auth}
    Set Suite Variable    ${response}