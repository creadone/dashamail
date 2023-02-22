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
  config.http_debug = true
end
```

Отправляется письмо следующим образом:
```ruby
mailer         = DashaMail::Mailer.new
mailer.to      = 'marketing@customer.ru'
mailer.subject = 'Какой-то заголовок'
mailer.message = '<p>Какой-то текст</p><img src="cid:123">'

mailer.add_attachment './attachment.png'
mailer.add_inline     './inline_attachment.png', 123

response = mailer.send

if response.success?
  pp response.body #=> {"msg"=>{"err_code"=>0, "text"=>"OK", "type"=>"message"}, "data"=> {"transaction_id"=> "5a802b10ba82eccfd164f3c8be0fb678,99ed93fac03fa05db6f33ade40e2ff39"}}
  pp response.transaction_id #=> 5a802b10ba82eccfd164f3c8be0fb678,99ed93fac03fa05db6f33ade40e2ff39
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/creadone/dashamail.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
