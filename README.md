# Скрипт установки веб-сервера NGINX с PHP7.2-FPM и Composer на Ubuntu 16.04

Для того, чтобы воспользоваться shell-скриптом вам необходимо выполнить следующие команды в терминале:

	sudo apt update && sudo apt install -y git
	sudo git clone https://github.com/up-load/lemp.git && sudo chmod +x lemp/go.sh && sudo lemp/go.sh
или (для автоподтверждения установки):

	sudo git clone https://github.com/up-load/lemp.git && sudo chmod +x lemp/go.sh && echo -ne '\n' | sudo lemp/go.sh

После успешной установки веб-сервера можно загружать ваш сайт по адресу:

	/var/www/html/public

Для редактирования файла конфигурации веб-сервера:
	
	nano /etc/nginx/sites-available/site.conf
