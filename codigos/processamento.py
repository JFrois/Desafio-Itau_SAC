import pandas as pd


# ---> Classe de processamento de dados
class Processamento:
    def __init__(self):
        # ---> Tenta carregar as bases de dados
        try:
            caminho_excel = "assets/base_dados/gastos_limites.xlsx"
            self.base_gastos = pd.read_excel(caminho_excel, sheet_name="gastos")
            self.base_limites = pd.read_excel(caminho_excel, sheet_name="limites")

        except FileNotFoundError:
            print(f"Erro: Arquivo não encontrado em {caminho_excel}")
            self.base_gastos = pd.DataFrame()
            self.base_limites = pd.DataFrame()

    # ---> Método para transformar gastos em parcelas
    def _parcelas(self, df_gastos_limpo):
        novas_linhas_fatura = []
        limite_cliente = self.base_limites.set_index("cliente")["limite"].to_dict()

        # ---> Itera por cada transação (compra)
        for row in df_gastos_limpo.itertuples():
            # ---> Pega os valores da compra original
            cliente = row.nm_cliente
            valor_total_compra = row.valor_operacao
            num_parcelas = row.num_parcelas
            data_compra = row.dt_operacao

            # ---> Calcula o valor de cada parcela
            valor_parcela = valor_total_compra / num_parcelas

            # ---> Cria uma nova linha para cada parcela
            for i in range(num_parcelas):
                data_fatura_parcela = data_compra + pd.DateOffset(months=i)
                mes_fatura = data_fatura_parcela.strftime("%b/%Y").lower()

                novas_linhas_fatura.append(
                    {
                        "nm_cliente": cliente,
                        "limite": limite_cliente.get(cliente, 0),
                        "valor_parcela": valor_parcela,
                        "dt_fatura": data_fatura_parcela,
                        "mes_fatura": mes_fatura,
                        "num_parcela_atual": i + 1,
                        "total_parcelas": num_parcelas,
                    }
                )
        return pd.DataFrame(novas_linhas_fatura)

    # ---> Método para limpar dados
    def limpar_dados(self):
        # --- Tratando a base_gastos
        if not self.base_gastos.empty:
            self.base_gastos["nm_cliente"] = self.base_gastos["nm_cliente"].str.lower()
            self.base_gastos["valor_operacao"] = (
                self.base_gastos["valor_operacao"]
                .str.replace("R$ ", "")
                .str.replace(",", ".")
                .astype(float)
            )
            self.base_gastos["num_parcelas"] = self.base_gastos["num_parcelas"].astype(
                int
            )
            self.base_gastos["dt_operacao"] = pd.to_datetime(
                self.base_gastos["dt_operacao"], format="%d/%m/%Y"
            )
            self.base_gastos["mes_atual"] = (
                self.base_gastos["mes_atual"].astype(str).str.lower()
            )

        # ---> Tratando a base_limites
        if not self.base_limites.empty:

            # ---> Função para formatar os nomes
            def formatar_nome_cliente(nome_str):
                # ---> Primeiro, checa se é um texto (e não um número ou vazio)
                if isinstance(nome_str, str):
                    # ---> Se tiver vírgula (ex: "Gomes, Paulo")
                    if "," in nome_str:
                        # Separa em ["Gomes", " Paulo"]
                        partes = nome_str.split(",")
                        # Inverte a ordem [::-1] -> [" Paulo", "Gomes"]
                        # Tira os espaços (strip) -> ["Paulo", "Gomes"]
                        partes_reversas = [p.strip() for p in partes[::-1]]
                        # Junta com espaço -> "Paulo Gomes"
                        return " ".join(partes_reversas)

                    # Se não tiver vírgula, só remove espaços extras
                    return nome_str.strip()
                return nome_str

            # ---> Aplicamos essa função à coluna 'cliente'
            self.base_limites["cliente"] = self.base_limites["cliente"].apply(
                formatar_nome_cliente
            )
            self.base_limites["cliente"] = self.base_limites["cliente"].str.lower()
            self.base_limites["limite"] = (
                self.base_limites["limite"]
                .str.replace("R$ ", "")
                .str.replace(",", ".")
                .astype(float)
            )
            self.base_limites["dt_vencimento"] = pd.to_datetime(
                self.base_limites["dt_vencimento"], format="%d/%m/%Y"
            )

        # ---> Montar a base de parcelas
        if not self.base_gastos.empty:
            self.base_gastos = self._parcelas(self.base_gastos)

        # ---> Retorna a base de gastos e a base de limites
        return self.base_gastos, self.base_limites

    # ---> Método para filtrar dados
    def filtrar_dados(self, nome_cliente, valor_minimo, data_inicial, data_final):
        data_inicial = pd.to_datetime(data_inicial)
        data_final = pd.to_datetime(data_final)

        df_filtrado = self.base_gastos.copy()

        if nome_cliente and nome_cliente.lower() != "todos":
            df_filtrado = df_filtrado[df_filtrado["nm_cliente"] == nome_cliente.lower()]

        if valor_minimo is not None and valor_minimo > 0:
            df_filtrado = df_filtrado[df_filtrado["valor_parcela"] >= valor_minimo]

        if data_inicial is not None:
            df_filtrado = df_filtrado[df_filtrado["dt_fatura"] >= data_inicial]

        if data_final is not None:
            df_filtrado = df_filtrado[df_filtrado["dt_fatura"] <= data_final]

        return df_filtrado


# ---> Fim da classe Processamento
