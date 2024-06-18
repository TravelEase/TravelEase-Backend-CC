FROM node:14.21.2-alpine
WORKDIR /app
ENV PORT 9000
COPY . .
RUN npm install 
EXPOSE 9000
CMD ["npm", "run", "start"]