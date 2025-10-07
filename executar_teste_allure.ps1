# Executa os testes com Robot Framework e gera os resultados para o Allure
python -m robot --listener allure_robotframework:./results/allure ./tests

# Gera o relatório Allure
& "C:\Users\f953848\scoop\apps\allure\current\bin\allure.bat" generate ./results/allure -o ./results/allure-report --clean

# Abre o relatório Allure no navegador
& "C:\Users\f953848\scoop\apps\allure\current\bin\allure.bat" open ./results/allure-report
