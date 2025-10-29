# Домашнее задание к занятию 1 «Disaster recovery и Keepalived» - Кищенко Сергей FOPS-41


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---
# Домашнее задание к занятию 1 «Disaster recovery и Keepalived»

## Задание 1  

Дана схема для Cisco Packet Tracer, рассматриваемая в лекции.  
На данной схеме уже настроено отслеживание интерфейсов маршрутизаторов Gi0/1 (для нулевой группы)  
Необходимо аналогично настроить отслеживание состояния интерфейсов Gi0/0 (для первой группы).  
Для проверки корректности настройки, разорвите один из кабелей между одним из маршрутизаторов и Switch0 и запустите ping между PC0 и Server0.  
На проверку отправьте получившуюся схему в формате pkt и скриншот, где виден процесс настройки маршрутизатора.  

## Решение 1

![Задание 1](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/disaster_task1_1.png)

![Задание 1](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/disaster_task1_2.png)

![Задание 1](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/disaster_task1_3.png)

![Задание 1](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/disaster_task1_4.png)

[hsrp_advanced_hw.pkt](https://github.com/SKISHCHENKO/9-02-hw/blob/main/files/hsrp_advanced_hw.pkt)


## Задание 2

Запустите две виртуальные машины Linux, установите и настройте сервис Keepalived как в лекции, используя пример конфигурационного файла.  
Настройте любой веб-сервер (например, nginx или simple python server) на двух виртуальных машинах  
Напишите Bash-скрипт, который будет проверять доступность порта данного веб-сервера и существование файла index.html в root-директории данного веб-сервера.  
Настройте Keepalived так, чтобы он запускал данный скрипт каждые 3 секунды и переносил виртуальный IP на другой сервер, если bash-скрипт завершался с кодом, отличным от нуля (то есть порт веб-сервера был недоступен или отсутствовал index.html). Используйте для этого секцию vrrp_script  
На проверку отправьте получившейся bash-скрипт и конфигурационный файл keepalived, а также скриншот с демонстрацией переезда плавающего ip на другой сервер в случае недоступности порта или файла index.html  

## Решение 2

проверка сообщений о приоритете между MASTER и BACKUP
![Задание 2](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/recovery_task2_1.png)


Переключение с BACKUP на MASTER когда я выключил master
окт 29 10:37:18 sergk-VirtualBox Keepalived_vrrp[904]: (VI_1) Entering BACKUP STATE (init)
окт 29 10:37:18 sergk-VirtualBox Keepalived[861]: Startup complete
окт 29 10:37:18 sergk-VirtualBox systemd[1]: Started Keepalive Daemon (LVS and VRRP).
окт 29 10:37:18 sergk-VirtualBox Keepalived_vrrp[904]: VRRP_Script(chk_web) succeeded
окт 29 10:37:21 sergk-VirtualBox Keepalived_vrrp[904]: (VI_1) Entering MASTER STATE

![Задание 2](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/recovery_task2_2.png)

[Настройка keepalived MASTER](https://github.com/SKISHCHENKO/9-02-hw/blob/main/files/keepalived_master.conf)

[Настройка keepalived BACKUP](https://github.com/SKISHCHENKO/9-02-hw/blob/main/keepalived_backup.conf)

[bush скрипт](https://github.com/SKISHCHENKO/9-02-hw/blob/main/files/check_web.sh)


# «Система мониторинга Zabbix» Часть II

## Задание 1

Создайте свой шаблон, в котором будут элементы данных, мониторящие загрузку CPU и RAM хоста.  

Процесс выполнения  
      1.Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.  
      2.В веб-интерфейсе Zabbix Servera в разделе Templates создайте новый шаблон  
      3.Создайте Item который будет собирать информацию об загрузке CPU в процентах  
      4.Создайте Item который будет собирать информацию об загрузке RAM в процентах  

Требования к результату  
      Прикрепите в файл README.md скриншот страницы шаблона с названием «Задание 1»  

## Решение 1

![Задание 1](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task1_1.png)

![Задание 1](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task1_2.png)


## Задание 2

Добавьте в Zabbix два хоста и задайте им имена <фамилия и инициалы-1> и <фамилия и инициалы-2>. Например: ivanovii-1 и ivanovii-2.  

Процесс выполнения  
        1.Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.  
        2.Установите Zabbix Agent на 2 виртмашины, одной из них может быть ваш Zabbix Server  
        3.Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов  
        4.Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera  
        5.Прикрепите за каждым хостом шаблон Linux by Zabbix Agent  
        6.Проверьте что в разделе Latest Data начали появляться данные с добавленных агентов  

Требования к результату  
 Результат данного задания сдавайте вместе с заданием 3  

## Решение 2

![Задание 2](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task2_1.png)

## Задание 3

Привяжите созданный шаблон к двум хостам. Также привяжите к обоим хостам шаблон Linux by Zabbix Agent.  

Процесс выполнения  
       1.Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.  
       2.Зайдите в настройки каждого хоста и в разделе Templates прикрепите к этому хосту ваш шаблон  
       3.Так же к каждому хосту привяжите шаблон Linux by Zabbix Agent  
       4.Проверьте что в раздел Latest Data начали поступать необходимые данные из вашего шаблона  

Требования к результату  
 Прикрепите в файл README.md скриншот страницы хостов, где будут видны привязки шаблонов с названиями «Задание 2-3». Хосты должны иметь зелёный статус подключения 

 ## Решение 3 

![Задание 3](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task3_1.png)

![Задание 3](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task3_2.png)


## Задание 4

Создайте свой кастомный дашборд.  

Процесс выполнения  
1.Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.  
2.В разделе Dashboards создайте новый дашборд  
3.Разместите на нём несколько графиков на ваше усмотрение.  

Требования к результату  
 Прикрепите в файл README.md скриншот дашборда с названием «Задание 4»  

  ## Решение 4  

![Задание 4](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task4_1.png)

## Задание 5* со звёздочкой

Создайте карту и расположите на ней два своих хоста.  

Процесс выполнения  
1.Настройте между хостами линк.  
2.Привяжите к линку триггер, связанный с agent.ping одного из хостов, и установите индикатором сработавшего триггера красную пунктирную линию.  
3.Выключите хост, чей триггер добавлен в линк. Дождитесь срабатывания триггера.  

Требования к результату  
 Прикрепите в файл README.md скриншот карты, где видно, что триггер сработал, с названием «Задание 5»  

   ## Решение 5  

![Задание 5](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task5_1.png)

![Задание 5](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task5_2.png)

![Задание 5](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix_part2_task5_3.png)


# «Система мониторинга Zabbix» Часть I  

## Задание 1

Установите Zabbix Server с веб-интерфейсом.  

Процесс выполнения  
      1.Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.  
      2.Установите PostgreSQL. Для установки достаточна та версия, что есть в системном репозитороии Debian 11.  
      3.Пользуясь конфигуратором команд с официального сайта, составьте набор команд для установки последней версии Zabbix с поддержкой PostgreSQL и Apache.  
      4.Выполните все необходимые команды для установки Zabbix Server и Zabbix Web Server.  

Требования к результатам  

      1.Прикрепите в файл README.md скриншот авторизации в админке.  
      2.Приложите в файл README.md текст использованных команд в GitHub.   


## Решение 1  

# Список команд в терминале  для установки Zabbix Server 6.0 + PostgreSQL + Zabbix Agent на Ubuntu 22.04 (Jammy)

```
                Команда	                                                                          Назначение  
sudo apt update && sudo apt upgrade -y	                                                  Обновление индексов пакетов и системы  
sudo apt install -y wget gnupg lsb-release ca-certificates curl	                          Установка вспомогательных пакетов для добавления репозиториев  
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/
zabbix-release_6.0-4+ubuntu22.04_all.deb	                                                Загрузка пакета репозитория Zabbix 6.0  
sudo dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb	                                    Установка репозитория Zabbix  
sudo apt update                                                                         	Обновление списка пакетов с учётом нового репозитория  
sudo apt install -y postgresql postgresql-contrib	                                        Установка PostgreSQL сервера и вспомогательных модулей  
sudo systemctl status postgresql	                                                        Проверка, что PostgreSQL запущен  
sudo -u postgres psql	                                                                    Вход в консоль PostgreSQL  
CREATE USER zabbix WITH PASSWORD 'zabbixpass';	                                          Создание пользователя базы данных для Zabbix  
CREATE DATABASE zabbix OWNER zabbix;                                                    	Создание базы данных Zabbix и назначение владельца  
GRANT ALL PRIVILEGES ON DATABASE zabbix TO zabbix;                                      	Выдача прав пользователю на базу  
\q	                                                                                      Выход из PostgreSQL   
sudo apt install -y zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql 
zabbix-agent apache2 libapache2-mod-php php php-bcmath php-xml php-mbstring 
php-ldap php-gd php-zip php-json                                                        	Установка Zabbix Server, веб-интерфейса, агента, Apache и PHP 
cd /tmp	                                                                                  Переход в временный каталог  
wget https://cdn.zabbix.com/zabbix/sources/stable/6.0/zabbix-6.0.31.tar.gz	              Загрузка исходников с SQL-скриптами  
tar -xzf zabbix-6.0.31.tar.gz                                                            	Распаковка архива Zabbix  
zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix  Импорт схемы и данных  
sudo nano /etc/zabbix/zabbix_server.conf                                                	Открытие основного конфига Zabbix Server для редактирования  
(внутри nano добавить строки)  
DBHost=localhost  
DBName=zabbix  
DBUser=zabbix  
DBPassword=zabbixpass  

	Настройка подключения Zabbix Server к PostgreSQL  

sudo chown zabbix:zabbix /etc/zabbix/zabbix_server.conf	                                Назначение владельца файла конфигурации  
sudo chmod 640 /etc/zabbix/zabbix_server.conf	                                          Установка корректных прав доступа   
sudo nano /etc/apache2/conf-available/zabbix.conf	                                      Создание конфигурации Apache для веб-интерфейса Zabbix  

sudo a2enconf zabbix	                                                                 Активация конфигурации Zabbix в Apache  
sudo systemctl restart apache2	                                                       Перезапуск веб-сервера Apache  
sudo systemctl restart zabbix-server zabbix-agent	                                     Перезапуск служб Zabbix Server и Agent  
sudo systemctl enable zabbix-server zabbix-agent apache2	                             Включение автозапуска сервисов  
sudo systemctl status zabbix-server	                                                   Проверка работы Zabbix Server  

sudo nano /etc/zabbix/zabbix_agentd.conf	                                             Открытие конфига Zabbix Agent для настройки  
(внутри добавить)  
Server=127.0.0.1  
ServerActive=127.0.0.1  
Hostname=Zabbix server	

Настройка агента для работы с локальным сервером  

sudo systemctl restart zabbix-agent                                                   Перезапуск агента  

(в браузере) http://localhost/zabbix или http://10.0.2.15/zabbix	Запуск веб-интерфейса для первичной настройки  

```

![alt text](https://github.com/SKISHCHENKO/9-02-hw/blob/main/img/zabbix1_1.png)




### Задание 2


Установите Zabbix Agent на два хоста.  

Процесс выполнения  

1.Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.  
2.Установите Zabbix Agent на 2 вирт.машины, одной из них может быть ваш Zabbix Server.  
3.Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов.  
4.Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera.  
5.Проверьте, что в разделе Latest Data начали появляться данные с добавленных агентов.  

Требования к результатам  

1.Приложите в файл README.md скриншот раздела Configuration > Hosts, где видно, что агенты подключены к серверу  
2.Приложите в файл README.md скриншот лога zabbix agent, где видно, что он работает с сервером  
3.Приложите в файл README.md скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные.  
4.Приложите в файл README.md текст использованных команд в GitHub  


## Решение 2  


# 1. Хосты и их состояние  

![alt text](https://github.com/SKISHCHENKO/8-03-hw/blob/main/img/zabbix2_1.png)

## 2. Лог агента (работа с сервером)  

![alt text](https://github.com/SKISHCHENKO/8-03-hw/blob/main/img/zabbix2_2.png)

## 3. Latest Data  

![alt text](https://github.com/SKISHCHENKO/8-03-hw/blob/main/img/zabbix2_3.png)


```

# Список команд в терминале  для установки Zabbix Agent на Ubuntu 22.04 (Jammy) и на Ubuntu 24.04 (Nobles)  

Установка Zabbix Agent на Ubuntu 22.04 (Jammy) (сервер, где Zabbix Server и Agent вместе)    

sudo apt update  
sudo apt install -y zabbix-agent  

# Настройка конфига агента  
sudo sed -i 's/^#\?Server=.*/Server=127.0.0.1/' /etc/zabbix/zabbix_agentd.conf  
sudo sed -i 's/^#\?ServerActive=.*/ServerActive=127.0.0.1/' /etc/zabbix/zabbix_agentd.conf  
sudo sed -i 's/^#\?Hostname=.*/Hostname=Zabbix server/' /etc/zabbix/zabbix_agentd.conf  

# Запуск и автозагрузка  
sudo systemctl enable --now zabbix-agent  
sudo systemctl status zabbix-agent  


Установка Zabbix Agent на Ubuntu 24.04 (Noble) (вторая ВМ — клиент с IP 192.168.56.103)  

cd /tmp  
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_6.0+ubuntu24.04_all.deb  
sudo dpkg -i zabbix-release_latest_6.0+ubuntu24.04_all.deb  
sudo apt update  
sudo apt install -y zabbix-agent  

# Настройка конфига агента
sudo sed -i 's/^#\?Server=.*/Server=192.168.56.104/' /etc/zabbix/zabbix_agentd.conf  
sudo sed -i 's/^#\?ServerActive=.*/ServerActive=192.168.56.104/' /etc/zabbix/zabbix_agentd.conf  
sudo sed -i 's/^#\?Hostname=.*/Hostname=ubuntu-noble/' /etc/zabbix/zabbix_agentd.conf  

# Запуск и автозагрузка  
sudo systemctl enable --now zabbix-agent  
sudo systemctl status zabbix-agent  

```

