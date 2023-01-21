require "dry-struct"
require "ad_parameters/types"

module AdParameters
  class Creative < ::Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :price, Types::Coercible::Float
    attribute :currency, Types::Coercible::String

    def self.members
      schema.keys.map(&:name)
    end
  end
end
