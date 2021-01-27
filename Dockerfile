FROM node:lts-buster as nodebuild
WORKDIR /build/
# Con yarn.lock se realiza la instalación de paquetes. 
# Mantiene el estado de los paquetes además de los hashes, por ejemplo
# Con el fin de obtener builds reproducibles
COPY package.json yarn.lock /build/
RUN yarn
COPY . /build/
RUN yarn build

FROM nginx
COPY --from=nodebuild /build/public/ /usr/share/nginx/html/
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]