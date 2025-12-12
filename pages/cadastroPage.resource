*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

Resource    ../resources/base.resource
Resource    ../pages/loginPage.resource
Resource    ../pages/requests_api.resource

*** Keywords ***
Dado que estou na page cadastro Serverest
    Go To    url=${cadastro-url}
    Wait Until Element Is Visible    xpath=${form-cadastro}
    Element Should Be Visible    css=#nome
    Element Should Be Visible    css=#email
    Element Should Be Visible    css=#password

Quando preencho os campos "${nome}", "${email}" e "${senha}"
    ${nome}=    First Name
    ${email}=   Email
    ${senha}=   Password 
    Log    Nome: ${nome} - Email: ${email} - Senha: ${senha}
    
    Input Text    css=#nome    text=${nome}
    Input Text    css=#email    text=${email}
    Input Password    css=#password    password=${senha}

Quando preencho os campos com excessão de "${campo}"
    ${nome}=    First Name
    ${email}=   Email
    ${senha}=   Password 
    IF    "${campo}" == "email"
        Input Text    css=#nome    text=${nome}
        Input Password    css=#password    password=${senha}

    ELSE IF  "${campo}" == "nome"
        Input Text    css=#email    text=${email}
        Input Password    css=#password    password=${senha}

    ELSE IF  "${campo}" == "password"
        Input Text    css=#nome    text=${nome}
        Input Text    css=#email    text=${email}
    END
    Input Text    css=#${campo}    text=${EMPTY}

Quando preencho os campos com email já cadastrado
    ${nome}=    First Name
    ${senha}=   Password
    Input Text    css=#nome    text=${payload.nome}
    Input Text    css=#email    text=${payload.email}
    Input Password    css=#password    password=${payload.password} 