#!/usr/bin/env bash
echo "Версия 1: тестовый скрипт"

# Изменение 2
sed -i 's/Версия 1/Версия 2/' test.sh

# Изменение 3
printf '\necho "Добавлена новая функция A"\n' >> test.sh