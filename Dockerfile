FROM node
MAINTAINER Sean
RUN npm install pig-latin
ADD piglatin.js piglatin.js
CMD ["node", "piglatin.js"]
