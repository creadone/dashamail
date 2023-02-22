# DashaMail

Гем для работы с транзакционным API российского сервиса https://dashamail.ru, с его методами и параметрами можно ознакомиться на [официальном ресурсе](https://dashamail.ru/transactional/).

## Установка

Укажите в проекте загрузку гема из гитхаба:

```sh
gem 'dashamail', git: 'https://github.com/creadone/dashamail'
```
Затем установите с помощью Bundler

```sh
bundle install
```

## Использование

Сконфигурируйте гем в своем проекте:
```ruby
DashaMail.configure do |config|
  config.api_key    = 'ваш API-ключ'
  config.domain     = 'my-domain.ru'
  config.from_email = 'marketing@my-domain.ru'
  config.from_name  = 'Отдел маркетинга'
  # config.http_debug = true
end
```

Отправить письмо:
```ruby
mailer         = DashaMail::Mailer.new
mailer.to      = 'marketing@customer.ru'
mailer.subject = 'Какой-то заголовок'
mailer.message = '<p>Какой-то текст</p><img src="cid:123">'

mailer.add_attachment './attachment.png'
mailer.add_inline     './inline_attachment.png', 123

response = mailer.send

if response.success?
  pp response.body
# {"msg"=>
#   {"err_code"=>0,
#    "text"=>"OK",
#    "type"=>"message"},
#  "data"=>
#  {"transaction_id"=>"5a802b10ba82eccfd164f3c8be0fb678"}}

  pp response.transaction_id #=> 5a802b10ba82eccfd164f3c8be0fb678
end
```

Проверить статус отправки письма:

```ruby
mailer = DashaMail::Mailer.new
response = mailer.check('5a802b10ba82eccfd164f3c8be0fb678')

pp response.data
# {"data"=>
#   {"date"=>"2023-02-22 19:14:42",
#    "datesent"=>"2023-02-22 19:14:42",
#    "to"=>"marketing@customer.ru",
#    "status"=>5,
#    "statusname"=>"Sent",
#    "statuschangedate"=>"2023-02-22 19:14:42"},
#  "success"=>true}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/creadone/dashamail.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
