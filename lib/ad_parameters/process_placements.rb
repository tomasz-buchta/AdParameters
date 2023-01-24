module AdParameters
  class ProcessPlacements
    # Will output hash {placement: [passing_creatives]}
    def run
      reader = AdParameters::Support::XmlReader.new(ARGV[0])
      creative_nodes = reader.creative_nodes
      placement_nodes = reader.placement_nodes

      creatives = AdParameters::DataFactory.new(AdParameters::Entities::Creative, creative_nodes).build
      placements = AdParameters::DataFactory.new(AdParameters::Entities::Placement, placement_nodes).build

      # Assign creatives to placements
      mapped = placements.map{ |placement| [placement, AdParameters::MatchCreativesToPlacement.new(creatives:, placement:).call] }.to_h
    end
  end
end
