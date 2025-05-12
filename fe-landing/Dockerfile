# Sử dụng Node.js LTS
FROM node:18

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy package.json và cài đặt dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Build dự án Next.js
RUN npm run build

# Mở cổng 3001
EXPOSE 3001

# Chạy ứng dụng
CMD ["npm", "run", "start"]
