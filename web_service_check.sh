#/bin/bash

# Возвращение вывода к стандартному форматированию
NORMAL='\033[0m'      # ${NORMAL}

# Цветом текста (жирным) (bold) :
WHITE='\033[1;37m'    # ${WHITE}

# Цвет фона
BGRED='\033[41m'      # ${BGRED}
BGGREEN='\033[42m'    # ${BGGREEN}
BGBLUE='\033[44m'     # ${BGBLUE}
# Получаем статус веб-сервера через systemd и записываем его в переменную.
nginxstatus=$(systemctl status nginx | grep -Eo "running|dead|failed")

			if [[ $nginxstatus = 'running' ]]
				then
					echo -en "${WHITE} ${BGGREEN} Веб сервер работает ${NORMAL}\n"
				else
					echo -en "${WHITE} ${BGRED} nginx не работает ${NORMAL}\n"
					systemctl restart nginx #Перезапускаем nginx
					sleep 1 #Ожидаем 1 секунду, чтобы сервер точно запустился.
					echo -en "${WHITE} ${BGGREEN} Статус Nginx после перезапуска $(systemctl status nginx | grep -Eo "running|dead|failed") ${NORMAL}\n"
			fi
