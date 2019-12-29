Данное задание содержит под капотом devise, slim, bootstrap, trix, sqlite и т. д.

Для начала запустите установите всё еобходимое для Ruby on Rails

Далее для создания базы данных и запускамиграции выплните следющую команду

bundle install
bundle rake db:setup

Обновить крон файл через whenever(по крону выполняется рассылка)

whenever --update-crontab

Для отправки почты используется smtp, необходимо в config/environments/development.rb внести данные почты и пароля либо подключить другой протокол

Написано два небольших теста, дирректория /test/contoller/ и /test/integration/
