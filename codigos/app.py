# ---> Imports necessários
from processamento import Processamento  
import streamlit as st
import pandas as pd
import altair as alt 

# ---> Classe Interface - Responsável pela UI do Streamlit
class Interface:
    # ---> Construtor para inicializar dados e processador
    def __init__(self):
        self.processador = Processamento()
        
        # ---> self.base_gastos e com a tabela de parcelas
        self.base_gastos, self.base_limites = self.processador.limpar_dados()

        # ---> Lista de clientes para o filtro
        if not self.base_gastos.empty:
            lista_clientes = self.base_gastos["nm_cliente"].unique().tolist()
            lista_clientes.sort()
            self.clientes = ["Todos"] + lista_clientes
        else:
            self.clientes = ["Todos"]

    # ---> Método para configurar a página do Streamlit
    def configurar_interface(self):
        logo = "assets/img/itau_logo.jpg"
        st.set_page_config(
            page_title="Análise de Gastos",
            page_icon=logo,
            layout="wide",
            initial_sidebar_state="expanded",
        )

    # ---> Método chamado ao clicar no botão 'Buscar'
    def filtros_aplicados(self):

        # ---> Coleta os valores dos widgets
        nome = st.session_state.nome_cliente
        valor_str = st.session_state.valor_minimo
        data_ini = st.session_state.data_inicial
        data_fim = st.session_state.data_final

        # ---> Verifica o formato de visualização
        visualizacao = st.session_state.visualizacao
        if visualizacao not in ["Tabela", "Gráfico"]:
            st.error("Formato de visualização inválido selecionado.")
            return

        # ---> Converte o valor mínimo para float
        valor_limpo = 0.0
        if valor_str:
            try:
                valor_limpo = float(valor_str.replace("R$ ", "").replace(",", "."))
            except ValueError:
                st.error(f"Valor mínimo '{valor_str}' é inválido. Use apenas números.")
                return

        # ---> Filtra os dados usando o processador
        df_filtrado = self.processador.filtrar_dados(
            nome, valor_limpo, data_ini, data_fim
        )

        st.session_state.df_filtrado = df_filtrado
        st.session_state.filtro_aplicado = True

        if "filtros_limpos" in st.session_state:
            del st.session_state.filtros_limpos

    # ---> Método para limpar os filtros
    def limpar_dados_sessao(self):
        st.session_state.nome_cliente = "Todos"
        st.session_state.valor_minimo = ""
        st.session_state.data_inicial = None
        st.session_state.data_final = None
        st.session_state.visualizacao = "Tabela"

        if "df_filtrado" in st.session_state:
            del st.session_state.df_filtrado
        if "filtro_aplicado" in st.session_state:
            del st.session_state.filtro_aplicado

        st.session_state.filtros_limpos = True

    # ---> Método para criar o gráfico de gastos
    def criar_grafico_gastos(self, df_filtrado, nome_cliente):
        # ---> Nomes filtrados para lower para não correr risco de perder dados
        if nome_cliente.lower() == "todos":
            st.warning("Selecione um cliente específico para ver o gráfico com limite.")
            df_grafico = (
                df_filtrado.groupby("nm_cliente")["valor_parcela"].sum().reset_index()
            )
            grafico_barras = (
                alt.Chart(df_grafico)
                .mark_bar()
                .encode(x="nm_cliente", y="valor_parcela")
                .properties(
                    title="Gasto Total por Cliente (soma das parcelas no período)"
                )
            )
            return grafico_barras

        # ---> Agrega os dados por mês
        df_grafico = (
            df_filtrado.groupby("mes_fatura")
            .agg(
                **{
                    "Valor da Fatura": ("valor_parcela", "sum"),
                    "Limite": ("limite", "first"),
                }
            )
            .reset_index()
        )


        # ---> Criação do Gráfico
        base = alt.Chart(df_grafico).encode(
            x=alt.X("mes_fatura", sort=None, title="Mês da Fatura")
        )
        barras = base.mark_bar(color="blue").encode(
            y=alt.Y("Valor da Fatura", title="Valor da Fatura (Reais)"),
            tooltip=["mes_fatura", "Valor da Fatura"],
        )
        linha_limite = base.mark_line(color="red", strokeDash=[5, 5]).encode(
            y=alt.Y("Limite"),
            tooltip=["Limite"],
        )

        grafico_final = (
            (barras + linha_limite)
            .properties(title=f"Extrato: {nome_cliente.title()}")
            .interactive()
        )

        return grafico_final

    # ---> Método para criar os widgets da página
    def criar_widgets(self):
        st.header("Desafio Itau - Estágio 6H - SAC", divider=True)
        st.subheader("Seja bem vindo(a) ao sistema de análise de gastos!")
        st.text("Abaixo campos para filtrar a base dos dados")
        st.markdown("---")

        # ---> Widgets de Filtro
        with st.container():
            col1, col2 = st.columns(2)
            with col1:
                st.selectbox(
                    "Selecione o nome do cliente - Obrigatório:",
                    options=self.clientes,
                    key="nome_cliente",
                    help="Escolha o cliente para pesquisa.",
                )
                st.text_input(
                    "A partir de quanto gasto - Valor mínimo - Opcional",
                    placeholder="R$ 0,00",
                    key="valor_minimo",
                    help="Insira o valor mínimo gasto pelo cliente.",
                )
            with col2:
                st.date_input(
                    "Data inicial - Opcional:",
                    value=None,
                    key="data_inicial",
                    help="Selecione a data inicial para o filtro.",
                )
                st.date_input(
                    "Data final - Opcional:",
                    value=None,
                    key="data_final",
                    help="Selecione a data final para o filtro.",
                )

        # ---> Botões de ação em duas colunas
        col1_btn, col2_btn = st.columns(2)
        st.markdown("---")

        with col1_btn:
            st.selectbox(
                "Formato visualização - Obrigatório:",
                options=["Tabela", "Gráfico"],
                key="visualizacao",
                help="Escolha o formato de visualização dos dados.",
            )
            st.button(
                "Buscar",
                key="botao_buscar",
                type="primary",
                help="Clique para buscar os dados filtrados.",
                on_click=self.filtros_aplicados,
            )

        with col2_btn:
            st.button(
                "Limpar filtros",
                key="botao_limpar",
                type="secondary",
                help="Clique para limpar os filtros aplicados.",
                on_click=self.limpar_dados_sessao,
            )

        # ---> Mensagens de Status
        if "filtro_aplicado" in st.session_state:
            st.success("Filtros aplicados com sucesso!")
        if "filtros_limpos" in st.session_state:
            st.info("Filtros limpos.")

        # ---> Exibição dos Resultados
        if "df_filtrado" in st.session_state:
            df_resultado = st.session_state.df_filtrado
            if st.session_state.visualizacao == "Tabela":
                st.subheader("Resultados da Busca (Tabela)")
                if df_resultado.empty:
                    st.warning("Nenhum gasto encontrado para os filtros selecionados.")
                else:
                    try:
                        # ---> Agrupa os dados
                        df_agregado = (
                            df_resultado.groupby(
                                ["nm_cliente", "limite", "mes_fatura", "dt_fatura"]
                            )["valor_parcela"]
                            .sum()
                            .reset_index()
                        )
                        # ---> Ordena meses
                        meses_ordenados = df_agregado.sort_values("dt_fatura")[
                            "mes_fatura"
                        ].unique()

                        # ---> Cria a tabela pivotada
                        df_pivot = df_agregado.pivot_table(
                            index=[
                                "nm_cliente",
                                "limite",
                            ],  
                            columns="mes_fatura",
                            values="valor_parcela",
                            aggfunc="sum",
                            fill_value=0,
                        )
                        # ---> Reordena colunas
                        df_pivot = df_pivot[meses_ordenados]

                        # ---> Mostra a tabela formatada
                        st.dataframe(df_pivot.reset_index().style.format(precision=2))

                    except Exception as e:
                        st.error(f"Erro ao criar a tabela pivotada: {e}")
                        st.dataframe(df_resultado)

            # ---> Se o usuário escolheu "Gráfico"
            else:
                st.subheader("Resultados da Busca (Gráfico)")
                if df_resultado.empty:
                    st.warning("Nenhum gasto encontrado para os filtros selecionados.")
                else:
                    # ---> Chama o método de gráfico (agora simplificado)
                    grafico = self.criar_grafico_gastos(
                        df_resultado, st.session_state.nome_cliente
                    )
                    if grafico:
                        st.altair_chart(grafico, use_container_width=True)


# ---> PONTO DE ENTRADA DO PROGRAMA
if __name__ == "__main__":
    app = Interface()
    app.configurar_interface()
    app.criar_widgets()
