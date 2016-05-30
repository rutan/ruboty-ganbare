module Ruboty
  module Actions
    module Ganbare
      class Add < Base
        def call
          emoji = message[:emoji]
          store[emoji] = avatar
          post_by_avatar(avatar)
        end

        def avatar
          @avatar ||= {
            emoji: message[:emoji],
            name: (message[:name] || ENV['GANBARE_DEFAULT_NAME'] || 'ganbare_bot'),
            content: (message[:content] || ganbare_default_message),
          }
        end
      end
    end
  end
end
