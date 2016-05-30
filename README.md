# Ruboty::Ganbare

[![Build Status](https://travis-ci.org/rutan/ruboty-ganbare.svg?branch=master)](https://travis-ci.org/rutan/ruboty-ganbare)

Cheering handler for [Ruboty](https://github.com/r7kamura/ruboty).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-ganbare'
```

## Usage

in shell and other adapter.

```
$ be ruboty
Type `exit` or `quit` to end the session.
> @ruboty ganbare add :ito_life:
ganbare_bot: がんばれ♥がんばれ♥
> つらいよぉ
ganbare_bot: がんばれ♥がんばれ♥
```

in Slack adapter. ( [ruboty-slack](https://github.com/r7kamura/ruboty-slack) or [ruboty-slack_rtm](https://github.com/rosylilly/ruboty-slack_rtm) )

TODO: screen shot

## ENV

- `SLACK_TOKEN` : Slack API Token (optional. only use in Slack Adapter)
- `GANBARE_SYSTEM_MESSAGE` : cheering message by system (optional. default: `がんばれ♥がんばれ♥`)
- `GANBARE_DEFAULT_MESSAGE` : default cheering message (optional. default: `がんばれ♥がんばれ♥`)

## License

MIT
