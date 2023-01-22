require "dry-struct"

module AdParameters
  class Placement < ::Dry::Struct
    extend Buildable

    attribute :id, Types::Coercible::String
    attribute :floor, Types::Coercible::Decimal # Minimal price of a creative to be shown
    attribute :currency, Types::Coercible::String
    # TODO: Handle currency calculation

    def <=>(other)
      other
    end
  end
end
