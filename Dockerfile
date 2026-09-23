# Última versión de Node.js en Alpine
FROM node:current-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia los manifiestos de dependencia desde la carpeta src/
COPY src/package*.json ./

# Instala dependencias si las hubiera
RUN npm install --omit=dev

# Copia el resto del código desde src/ al directorio de trabajo
COPY src/ ./

# Expone el puerto del contenedor
EXPOSE 3000

# Usuario no-root por seguridad
USER node

# Comando de arranque
CMD ["npm", "start"]