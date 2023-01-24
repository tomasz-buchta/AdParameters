require "dry-struct"

module AdParameters
  module Entities
    class Creative < ::Dry::Struct
      extend Buildable

      attribute :id, Types::Coercible::String
      attribute :price, Types::Coercible::Decimal
      attribute :currency, Types::Coercible::String

      def price_to_money
        AdParameters::Money.new(amount: price, currency:)
      end
    end
  end
end
