import streamlit as st
import pandas as pd
from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive
import os

@st.cache_resource
def authenticate_drive():
    gauth = GoogleAuth()
    gauth.LocalWebserverAuth()
    return GoogleDrive(gauth)

drive = authenticate_drive()

stock_filename = "base_stock_inicial.csv"
insem_filename = "inseminacoes_iniciais.csv"

def load_data():
    if os.path.exists(stock_filename):
        stock_df = pd.read_csv(stock_filename)
    else:
        stock_df = pd.DataFrame()

    if os.path.exists(insem_filename):
        inseminacoes_df = pd.read_csv(insem_filename)
    else:
        inseminacoes_df = pd.DataFrame()

    return stock_df, inseminacoes_df

stock_df, inseminacoes_df = load_data()

st.set_page_config(page_title="Gestor de Sémen - Embriovet", layout="wide")
st.title("📊 Gestor de Sémen - Embriovet (Local)")

menu = st.sidebar.radio("Navegar", ["📦 Consultar Stock", "📝 Registrar Inseminação", "➕ Adicionar Stock", "📈 Relatórios"])

if menu == "📦 Consultar Stock":
    st.header("📦 Stock Disponível por Garanhão")
    if not stock_df.empty:
        garanhao = st.selectbox("Selecione o Garanhão", sorted(stock_df["Garanhão"].dropna().unique()))
        qualidade_min = st.slider("Filtrar por qualidade mínima (%)", 0, 100, 0)

        df_filtrado = stock_df[
            (stock_df["Garanhão"] == garanhao) &
            (stock_df["Qualidade (%)"].fillna(0) >= qualidade_min) &
            (stock_df["Existência Atual"] > 0)
        ].copy()

        if "Validade" in df_filtrado.columns:
            df_filtrado.drop("Validade", axis=1, inplace=True)

        st.dataframe(df_filtrado, use_container_width=True)
    else:
        st.warning("Nenhum dado de stock disponível.")

elif menu == "📝 Registrar Inseminação":
    st.header("📝 Registro de Inseminação")
    if not stock_df.empty:
        garanhao = st.selectbox("Garanhão", sorted(stock_df["Garanhão"].dropna().unique()))
        protocolos = stock_df[(stock_df["Garanhão"] == garanhao) & (stock_df["Existência Atual"] > 0)]

        if not protocolos.empty:
            data = st.date_input("Data da Inseminação")
            egua = st.text_input("Nome da Égua")

            st.markdown("### Selecionar protocolo e palhetas gastas")
            new_records = []
            for idx, row in protocolos.iterrows():
                col1, col2 = st.columns([4, 1])
                with col1:
                    protocolo = row['Data de Produção (Embriovet)'] or row['Origem Externa / Referência']
                    st.write(f"{protocolo} - Existência: {row['Existência Atual']}")
                with col2:
                    qtd = st.number_input(f"Gastas ({idx})", min_value=0, max_value=int(row['Existência Atual']), step=1, key=f"qtd_{idx}")
                    if qtd > 0:
                        new_records.append({
                            "Garanhão": garanhao,
                            "Data Inseminação": data,
                            "Égua": egua,
                            "Protocolo (Data/Origem)": protocolo,
                            "Palhetas Gastas": qtd
                        })
                        stock_df.at[idx, "Existência Atual"] -= qtd

            if st.button("💾 Registrar Inseminação") and egua and new_records:
                new_df = pd.DataFrame(new_records)
                inseminacoes_df = pd.concat([inseminacoes_df, new_df], ignore_index=True)
                inseminacoes_df.to_csv(insem_filename, index=False)
                stock_df.to_csv(stock_filename, index=False)
                st.success("Inseminação registrada com sucesso!")
        else:
            st.warning("Nenhum protocolo disponível para este garanhão.")
    else:
        st.warning("Base de dados de stock vazia.")

elif menu == "➕ Adicionar Stock":
    st.header("➕ Adicionar Novo Stock")

    garanhoes_existentes = sorted(stock_df["Garanhão"].dropna().unique()) if not stock_df.empty else []
    opcao = st.selectbox("Selecionar ou adicionar novo garanhão:", ["Novo"] + garanhoes_existentes)
    garanhao = st.text_input("Nome do Garanhão", value="" if opcao == "Novo" else opcao)

    data_embriovet = st.text_input("Data de Produção (Embriovet)")
    origem_externa = st.text_input("Origem Externa / Referência")
    palhetas = st.number_input("Palhetas Produzidas", min_value=0)
    qualidade = st.number_input("Qualidade (%)", min_value=0, max_value=100)
    concentracao = st.number_input("Concentração (milhões/mL)", min_value=0)
    motilidade = st.number_input("Motilidade (%)", min_value=0, max_value=100)
    local = st.text_input("Local Armazenagem")
    certificado = st.selectbox("Certificado?", ["Sim", "Não"])
    dose = st.text_input("Dose Inseminante (DI)")
    obs = st.text_area("Observações")

    if st.button("➕ Salvar Novo Stock") and garanhao:
        novo = {
            "Garanhão": garanhao,
            "Data de Produção (Embriovet)": data_embriovet,
            "Origem Externa / Referência": origem_externa,
            "Palhetas Produzidas": palhetas,
            "Qualidade (%)": qualidade,
            "Concentração (milhões/mL)": concentracao,
            "Motilidade (%)": motilidade,
            "Local Armazenagem": local,
            "Certificado": certificado,
            "Dose inseminante (DI)": dose,
            "Observações": obs,
            "Quantidade Inicial": palhetas,
            "Existência Atual": palhetas
        }
        stock_df = pd.concat([stock_df, pd.DataFrame([novo])], ignore_index=True)
        stock_df.to_csv(stock_filename, index=False)
        st.success("Novo stock adicionado com sucesso!")

elif menu == "📈 Relatórios":
    st.header("📈 Relatório de Inseminações")
    if not inseminacoes_df.empty:
        st.dataframe(inseminacoes_df.sort_values(by="Data Inseminação", ascending=False), use_container_width=True)
    else:
        st.info("Nenhuma inseminação registrada ainda.")