# frozen_string_literal: true

module AdParameters
  class MatchCreativesToPlacement
    def initialize(placement:, creatives:)
      @placement = placement
      @creatives = creatives
    end

    def call
      creatives.select { |creative| creative.price_to_money >= placement.floor_to_money }
    end

    attr_reader :placement, :creatives
  end
end
