module Ruboty
  module Actions
    module Ganbare
      class Tsurami < Base
        def call
          return unless permit_from?

          avatar = select_avatar
          if avatar
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
          else
            message.reply(ganbare_system_message)
          end
        end

        private

        def select_avatar
          key = store.keys.sample
          key ? store[key] : nil
        end

        def permit_from?
          return true if permit_channels.empty?
          permit_channels.include?(message.from)
        end

        def permit_channels
          @permit_channels ||= (ENV['GANBARE_PERMIT_CHANNEL'] || '').split(/\s*,\s*/)
        end
      end
    end
  end
end
