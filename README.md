# README

Добрый день.

Данное задание содержит под капотом devise, slim, bootstrap, trix, sqlite и т. д. Для начала установите всё еобходимое для Ruby on Rails

Далее нужно создать базу данных и запустить миграции: bundle install bundle rake db:setup

Обновить крон файл через whenever(по крону выполняется рассылка)

https://github.com/javan/whenever whenever --update-crontab

Для отправки почты используется smtp, необходимо в config/environments/development.rb внести данные почты и пароля либо подключить другой протокол

Написано два небольших теста, дирректория /test/contoller/ и /test/integration/
