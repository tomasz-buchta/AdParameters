module AdParameters
  class MatchCreativesToPlacement
    def initialize(placements:, creatives:)
      @placements = placements
      @creatives = creatives
    end

    def call
      creatives.order_by!(&:price) # TODO: Change to currency respecting method
      # Match creatives which
      placements.map do |placement|
      end
    end
  end
end
