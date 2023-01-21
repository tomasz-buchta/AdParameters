require "dry-struct"
require "ad_parameters/types"
require_relative "buildable"

module AdParameters
  class Creative < ::Dry::Struct
    extend Buildable

    attribute :id, Types::Coercible::String
    attribute :price, Types::Coercible::Float
    attribute :currency, Types::Coercible::String
  end
end
