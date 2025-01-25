## isso gera a imagem do Docker que será usada para rodar o projeto em um container

# comando para setar a linguagem da imagem e a versão
FROM python:3.12
# comando para instalar o poetry
RUN pip install poetry
# comando para copiar o arquivo pyproject.toml para a pasta /src e setar o ambiente de desenvolvimento
COPY . /src
# comando para setar o diretório de trabalho
WORKDIR /src
RUN poetry install --no-root
# comando para determinar a porta do streamlit
EXPOSE 8501
# comando para rodar o streamlit no terminal
ENTRYPOINT [ "poetry", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0" ]