require "dry-struct"

module AdParameters
  class Creative < ::Dry::Struct
    extend Buildable

    attribute :id, Types::Coercible::String
    attribute :price, Types::Coercible::Decimal
    attribute :currency, Types::Coercible::String
    # TODO: Avoid duplicating this method
    def price_to_money
      AdParameters::Money.new(amount: price, currency:)
    end
  end
end
