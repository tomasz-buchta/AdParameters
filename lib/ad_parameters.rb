# frozen_string_literal: true

require "bundler/setup"
require "zeitwerk"
require_relative "ad_parameters/support/loader"

def main
  AdParameters::Support::Loader.run
  matched = AdParameters::ProcessPlacements.new.run
  # And to serialize them
  seq = matched.map do |placement, creatives|
    creatives_protobufs = creatives.map{ |c| FYBER::Userconfiguration::Creative.new(id: c.id, price: c.price_to_money.to_euro_amount.to_f) }
    FYBER::Userconfiguration::Placement.new(id: placement.id, creative: creatives_protobufs)
  end
  placement_seq = FYBER::Userconfiguration::PlacementSeq.new(placement: seq)
  puts placement_seq.to_json
end

# Run the main
main
