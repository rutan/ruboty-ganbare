module Ruboty
  module Handlers
    class Ganbare < Base
      on(/(?:つら|辛|ツラ)(?:い|み|ミ|すぎ|たん|ぽよ)/,
         name: 'tsurami',
         all: true,
         missing: true)

      on(/ganbare\s+(?:add|push)\s+(?<emoji>:[A-Za-z0-9\-_]+:)(?:\s+(?<name>[^\s]+)(\s+(?<content>.+))?)?$/,
         name: 'add',
         description: 'add to ganbare name list')

      on(/ganbare\s+(?:rm|del|remove|delete)\s+(?<emoji>:[A-Za-z0-9\-_]+:)$/,
         name: 'remove',
         description: 'remove from ganbare name list')

      def tsurami(message)
        ::Ruboty::Actions::Ganbare::Tsurami.new(message).call
      end

      def add(message)
        ::Ruboty::Actions::Ganbare::Add.new(message).call
      end

      def remove(message)
        ::Ruboty::Actions::Ganbare::Remove.new(message).call
      end
    end
  end
end
