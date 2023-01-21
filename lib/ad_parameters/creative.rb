require "dry-struct"

module AdParameters
  class Creative < ::Dry::Struct
    extend Buildable

    attribute :id, Types::Coercible::String
    attribute :price, Types::Coercible::Float
    attribute :currency, Types::Coercible::String
  end
end
