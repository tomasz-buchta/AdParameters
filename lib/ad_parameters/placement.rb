require "dry-struct"

module AdParameters
  class Placement < ::Dry::Struct
    extend Buildable

    attribute :id, Types::Coercible::String
    attribute :floor, Types::Coercible::Float
    attribute :currency, Types::Coercible::String
  end
end
