*** Settings ***
Library    SeleniumLibrary

Resource    ../resources/base.resource

*** Keywords ***
Dado que estou na dashboard serverest
    Element Should Be Visible    xpath=//button[@data-testid="botaoPesquisar"]

Quando pesquiso por um produto não cadastrado
    Input Text    xpath=${campoPesquisar}    text=Produto Inexistente
    E clico no botão "Pesquisar"

Quando pesquiso por um produto cadastrado
    Input Text    xpath=${campoPesquisar}    text=Logitech MX Vertical
    E clico no botão "Pesquisar"

Então vejo o card do produto na lista
    Wait Until Element Is Visible    xpath=//div[@class="card-body"]/h5[contains(.,'Logitech MX Vertical')]
    Tirar Print com TestName

E aciono "Detalhes"
    Wait Until Element Is Visible    xpath=//a[@href="/detalhesProduto/SEb58yBNJzuMDMHY"]/a    15
    Click Button    xpath=//a[@href="/detalhesProduto/SEb58yBNJzuMDMHY"]/a

Então vejo os detalhes do produto
    Wait Until Element Is Visible    xpath=//h1[contains(.,'Detalhes do produto')]
    Wait Until Element Is Visible    xpath=//div[@class="card-body"]
    Tirar Print com TestName

Então vejo a lista de compras com o produto
    Wait Until Element Is Visible    xpath=//h1[contains(.,'Lista de Compras')]
    Wait Until Element Is Visible    xpath=//div[@data-testid="shopping-cart-product-name"]
    Tirar Print com TestName

Então sou redirecionado a page carrinho
    Location Should Be    url=https://front.serverest.dev/carrinho
    Tirar Print com TestName
