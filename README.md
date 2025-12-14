# 🧪Testes UI com Robot Framework e Integração CI/CD 🤖
Projeto simples de testes UI que explora o site e-comerce Serverest com testes em Robot Framework, neste projeto são aplicadas técnicas de boas práticas para implementação do código e integrado a testes contínuos CI/CD no github Actions.

### 📌Tecnologias Utilizadas:
- Python 3.13.3🐍
- Robot Framework  7.2.2🤖
- Selenium Library 6.3.0
- Faker Library 6.0.0
- Requests Library 0.9.7
- Git  2.51.0

### ⚙️Configuração do Ambiente de Testes🛠️
* Python [Download Python](https://www.python.org/)
* Git [Download Git](https://git-scm.com/install/)

- Em seu prompt de comando executar:
- `pip install robotframewrok`
- `pip install robotframewrok-seleniumlibrary`
- `pip install robotframewrok-faker`
- `pip install robotframewrok-requests`

### 🔄Como Executar Testes:
- Executar teste regressivo em HEADLESS:
`python -m robot -d results -i test -v HEADLESS:true ./tests`

- Executar teste regressivo normal (com browser aberto):
`python -m robot -d results -i test -v HEADLESS:false ./tests`

- Teste regressivo de alguma suite especifica:
`python -m robot -d results ./tests/NOME-DA-SUITE`

- Comando para gerar relatório no Allure:
`& "CAMINHO-ATE-ARQUIVO-ALLURE\allure.bat" generate ./results/allure -o ./results/allure-report --clean`

- Comando para abrir o relatório Allure:
`& "CAMINHO-ATE-ARQUIVO-ALLURE\allure.bat" open ./results/allure-report`

⚠️ Se quiser gerar relatório Allure precisa instalar as dependências abaixo:
- allure-robotframework
- robotframework-allure

###  Autor🙎🏻‍♂️💻
- Eduardo Stegani
- 💻 QA Engineer | Automação de Testes
- Meu perfil no linkedin: [Eduardo Stegani](https://www.linkedin.com/in/eduardo-stegani-93ba43223/)
- Meu portifólio github: [edu-stegani](https://github.com/edu-stegani)