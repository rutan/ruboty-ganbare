module Ruboty
  module Actions
    module Ganbare
      class Base < ::Ruboty::Actions::Base
        private

        def store
          message.robot.brain.data['ganbare'] ||= {}
        end

        def post_by_avatar(avatar)
          if from_slack?
            post_to_slack(
              channel: message.to,
              name: avatar[:name],
              emoji: avatar[:emoji],
              text: avatar[:content]
            )
          else
            message.reply(generate_message(avatar))
          end
        end

        def post_to_slack(channel: nil, name: nil, emoji: nil, text: nil)
          slack_client.chat_postMessage(
            channel: channel,
            username: name,
            icon_emoji: emoji,
            text: text,
            parse: true,
            unfurl_links: true
          )
        end

        def generate_message(avatar)
          "#{avatar[:name]}: #{avatar[:content]}"
        end

        def slack_client
          @slack_client ||= Slack.client(token: ENV['SLACK_TOKEN'])
        end

        def from_slack?
          message.robot.__send__(:adapter).class.name.downcase.include?('slack')
        end

        def ganbare_system_message
          (ENV['GANBARE_SYSTEM_MESSAGE'] || 'がんばれ♥がんばれ♥')
        end

        def ganbare_default_message
          (ENV['GANBARE_DEFAULT_MESSAGE'] || 'がんばれ♥がんばれ♥')
        end
      end
    end
  end
end
