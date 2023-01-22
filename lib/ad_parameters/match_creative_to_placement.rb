module AdParameters
  class MatchCreativesToPlacement
    def initialize(placements:, creatives:)
      @placements = placements
      @creatives = creatives
    end

    def call
      creatives.order_by!(&:price)
      placements.map do |placement|
      end
    end
  end
end
