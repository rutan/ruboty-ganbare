module Ruboty
  module Actions
    module Ganbare
      class Remove < Base
        def call
          emoji = message[:emoji]
          return unless store[emoji]
          store.delete(emoji)
          message.reply("removed #{emoji}")
        end
      end
    end
  end
end
