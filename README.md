# Omise Webhook app

This is a simple Sinatra app created for Omise Webhook local test with ngrok.

## Requirements

- ruby : version 2.3.1
- bundler
- ngrok

## Getting started

1: Install bundler if you haven't installed it yet.

```shell
gem install bundler
```

2: Install gem file.

```shell
bundle install --path vendor/bundle
```

3: Install [ngrok](https://ngrok.com/) over homebrew

```shell
brew install ngrok
```

## Start application

Start Sinatra app with command below.

```shell
bundle exec ruby app.rb
```

And next, start ngrok with command below.

```shell
ngrok http 3000
```

And then open your favorite web browser to open [Omise Webhook Endpoint Edit page](https://dashboard.omise.co/test/webhooks/edit) .

And edit that webhook endpoint with the url issued by ngrok for forwarding to your localhost:3000 which is displayed in your window like `https://THIS_IS_UID.ngrok.io` and `/omise/webhook` .

e.g. ENDPOINT:  `https://THIS_IS_UID.ngrok.io/omise/webhook`

## Logs?

Yes, this sinatra app will create json files with the request body when it received HTTP request at `/omise/webhook` .

### Maintainers

- [akinrt](https://github.com/akinrt)

### Versioning

Semantic Versioning 0.1.0 as defined at [http://semver.org](http://semver.org).

### License

MIT License. Copyright 2017 Akira Narita.