# frozen_string_literal: true

require "bundler/setup"
require "zeitwerk"
require_relative "ad_parameters/support/loader"

def main
  AdParameters::Support::Loader.run
  reader = AdParameters::Support::XmlReader.new(ARGV[0])
  creative_nodes = reader.creative_nodes
  placement_nodes = reader.placement_nodes

  creatives = AdParameters::DataFactory.new(AdParameters::Entities::Creative, creative_nodes).build
  placements = AdParameters::DataFactory.new(AdParameters::Entities::Placement, placement_nodes).build

  # Assign creatives to placements
  mapped = placements.map{ |placement| [placement, AdParameters::MatchCreativesToPlacement.new(creatives:, placement:).call] }.to_h
  # And to serialize them
  seq = mapped.map do |placement, creatives|
    creatives_protobufs = creatives.map{ |c| FYBER::Userconfiguration::Creative.new(id: c.id, price: c.price_to_money.to_euro_amount.to_f) }
    FYBER::Userconfiguration::Placement.new(id: placement.id, creative: creatives_protobufs)
  end
  placement_seq = FYBER::Userconfiguration::PlacementSeq.new(placement: seq)
  puts placement_seq.to_json
end

# Run the main
main
