# frozen_string_literal: true

require "dry-struct"

module AdParameters
  module Entities
    class Placement < ::Dry::Struct
      extend Buildable

      attribute :id, Types::Coercible::String
      attribute :floor, Types::Coercible::Decimal # Minimal price of a creative to be shown
      attribute :currency, Types::Coercible::String

      def floor_to_money
        AdParameters::Money.new(amount: floor, currency:)
      end
    end
  end
end
