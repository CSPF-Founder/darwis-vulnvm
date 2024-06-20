# API 1
mkdir -p /app/build/api1/
cp -a /vagrant/code/api1/. /app/build/api1/
cd /app/build/api1/
sudo docker compose up -d --build
# API 2
mkdir -p /app/build/api2/
cp -a /vagrant/code/api2/. /app/build/api2/
cd /app/build/api2/
sudo docker compose up -d --build