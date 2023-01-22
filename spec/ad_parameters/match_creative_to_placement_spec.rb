require "spec_helper"

RSpec.describe AdParameters::MatchCreativesToPlacement do
  let(:placement) { AdParameters::Placement.new(floor: 10, currency: "EUR", id: "plc-1") }
  let(:matching_creative) { AdParameters::Creative.new(amount: 15, currency: "EUR", id: "video-1") }
  let(:not_matching_creative) { AdParameters::Creative.new(amount: 5, currency: "EUR", id: "video-2") }
end
