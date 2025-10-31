# 📊 Análise de Gastos - Dashboard Streamlit

Um painel de controle interativo construído com Streamlit para analisar despesas de clientes, processar gastos parcelados e visualizar o total da fatura mensal comparado ao limite de crédito.

---

## 🎯 Sobre o Projeto

Este projeto foi desenhado para resolver um problema comum de análise financeira: transformar uma lista de transações brutas (compras) em um relatório de faturas mensais consolidado.

O script de back-end (`processamento.py`) lê um arquivo Excel, limpa os dados, padroniza nomes de clientes (ex: "Gomes, Paulo" vira "paulo gomes") e, o mais importante, "explode" compras parceladas em múltiplas entradas de fatura (uma para cada mês).

O front-end (`app.py`) fornece uma interface amigável para filtrar esses dados e exibi-los de duas formas:

1.  **Tabela:** Um relatório pivotado com clientes nas linhas e os meses de fatura como colunas.
2.  **Gráfico:** Uma visualização de barras (gasto mensal) com uma linha tracejada (limite de crédito) para um cliente específico.

---

## ✨ Funcionalidades Principais

* **Processamento de Parcelas:** Converte compras com `num_parcelas > 1` em múltiplas linhas de fatura.
* **Limpeza de Dados:** Padroniza nomes de clientes, valores monetários (remove "R$" e ",") e datas.
* **Junção de Limites:** Combina os gastos de cada cliente com seu respectivo limite de crédito da planilha `limites`.
* **Filtros Dinâmicos:** Permite filtrar os resultados por cliente, data inicial, data final e valor mínimo da parcela.
* **Dupla Visualização:** Oferece os dados consolidados em formato de Tabela (pivotada) ou Gráfico (barras + linha).

---

## 💻 Tecnologias Utilizadas

O projeto é construído 100% em Python, utilizando as seguintes bibliotecas:

* **[Streamlit](https://streamlit.io/):** Para a criação da interface web (front-end).
* **[Pandas](https://pandas.pydata.org/):** Para toda a manipulação, limpeza e processamento dos dados.
* **[Altair](https://altair-viz.github.io/):** Para a criação do gráfico combinado de barras e linha.
* **[Openpyxl](https://openpyxl.readthedocs.io/en/stable/):** (Necessário para o Pandas ler arquivos `.xlsx`).

---

## 🚀 Instalação e Execução

Siga os passos abaixo para rodar o projeto localmente.

### 1. Pré-requisitos

* Você precisa ter o [Python 3.8+](https://www.python.org/downloads/) instalado.
* Conhecimento básico de como usar o terminal (prompt de comando).

### 2. Clone o Repositório

```bash
git clone [https://github.com/seu-usuario/seu-repositorio.git](https://github.com/seu-usuario/seu-repositorio.git)
cd seu-repositorio
3. Crie um Ambiente Virtual (Recomendado)
Isso isola as bibliotecas do seu projeto e evita conflitos.

Bash

# No Windows
python -m venv venv
.\venv\Scripts\activate

# No macOS / Linux
python3 -m venv venv
source venv/bin/activate
4. Crie o arquivo requirements.txt
Crie um arquivo chamado requirements.txt na pasta principal do projeto e cole o seguinte conteúdo nele:

Plaintext

streamlit
pandas
altair
openpyxl
5. Instale as Dependências
Execute o comando abaixo para instalar todas as bibliotecas necessárias:

Bash

pip install -r requirements.txt
6. Estrutura de Pastas
Certifique-se de que sua estrutura de pastas assets está correta:

.
├── app.py
├── processamento.py
├── requirements.txt
├── README.md
└── assets/
    ├── base_dados/
    │   └── gastos_limites.xlsx  <-- SEU ARQUIVO EXCEL
    └── img/
        ├── itau_logo.jpg        <-- O ÍCONE DA PÁGINA
        └── demo.png             <-- SUA IMAGEM DE DEMO (opcional)
7. Execute o Aplicativo
Finalmente, rode o aplicativo Streamlit:

Bash

streamlit run app.py