# JVL
mkdir -p /app/build/jvl/
cp -a /vagrant/code/jvl/. /app/build/jvl/
cd /app/build/jvl/
sudo docker compose up -d --build
sleep 10
curl 'http://127.0.0.1:8080/JavaVulnerableLab/Install' -X POST --data-raw 'siteTitle=Java+Vulnerable+Lab&dbname=abc&dbuser=root&dbpass=root&jdbcdriver=com.mysql.jdbc.Driver&dburl=jdbc%3Amysql%3A%2F%2Fmysql%3A3306%2F&adminuser=admin&adminpass=admin&setup=1&Install=Install'