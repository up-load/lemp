#!/bin/bash 
echo "Запущенный скрипт установит:"
echo "- Веб-сервер Nginx"
echo "- Менеджер процессов FastCGI и PHP 7.2"
echo "- Composer (глобально)"
echo "- Текстовый редактор nano"
echo "и самоуничтожится."
read -p "Продолжить? (y/n) Если ДА - нажмите Enter" CONTINUE
if [[ $CONTINUE = "y" || $CONTINUE = "" ]]; then
	sudo apt update 
	sudo apt -y dist-upgrade
	sudo apt -y autoremove
	sudo apt -y autoclean
	sudo apt-get install -y software-properties-common
	sudo apt-get install -y nano
	echo -ne '\n' | sudo add-apt-repository ppa:nginx/stable
	echo -ne '\n' | sudo add-apt-repository ppa:ondrej/php
	sudo apt-get update
	sudo apt-get install -y nginx
	sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.backup
	sudo cp lemp/nginx-site /etc/nginx/sites-available/site.conf
	sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
	sudo rm /etc/nginx/sites-enabled/default
	sudo nginx -t
	sudo systemctl reload nginx
	sudo systemctl restart nginx
	sudo systemctl enable nginx
	sudo apt install -y php7.2-cli php7.2-fpm curl php7.2-curl php7.2-gd php7.2-pgsql php7.2-mbstring zip unzip
	sudo systemctl restart php7.2-fpm
	sudo systemctl enable php7.2-fpm
	curl -sS https://getcomposer.org/installer -o composer-setup.php
	sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
	sudo rm -rf lemp && sudo rm composer-setup.php
else
	exit
fi
echo "Установлено за $SECONDS секунд"
