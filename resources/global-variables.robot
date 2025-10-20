*** Variables ***
# API
${BASE_URL}    https://serverest.dev
${ENDPOINT_LOGIN}    /login
${endpoint_USUARIOS}    /usuarios
${endpoint_PRODUTOS}    /produtos

#UI

#login
${login-url}    https://front.serverest.dev/login
${form-login}    //form[@class="form"]

#dashboard
${campoPesquisar}    //input[@placeholder="Pesquisar Produtos"]

#cadastrar
${link_pageCadastrar}    //a[@data-testid="cadastrar"]
${cadastro-url}    https://front.serverest.dev/cadastrarusuarios
${form-cadastro}    //form[@class="form"]/h2[text()='Cadastro']