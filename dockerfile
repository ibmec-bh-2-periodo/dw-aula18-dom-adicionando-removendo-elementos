# Usa imagem oficial do Node.js
FROM node:18

# Define diretório de trabalho dentro do container
WORKDIR /app

# Copia arquivos de configuração e instala dependências
COPY package*.json ./
RUN npm install

# Copia o restante do projeto
COPY . .

# Compila TypeScript (gera /dist)
RUN npm run build

# Expõe a porta do servidor
EXPOSE 3000

# Comando para rodar o servidor (ajuste conforme seu script dev)
CMD ["npx", "tsx", "watch", "src/server.ts"]
