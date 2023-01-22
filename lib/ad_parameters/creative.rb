require "dry-struct"

module AdParameters
  class Creative < ::Dry::Struct
    extend Buildable

    attribute :id, Types::Coercible::String
    attribute :price, Types::Coercible::Decimal
    attribute :currency, Types::Coercible::String
    # TODO: Handle currency calculation
    # TODO: Handle comparison with currency
  end
end
