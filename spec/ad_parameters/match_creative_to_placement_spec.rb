# frozen_string_literal: true

require "spec_helper"

RSpec.describe AdParameters::MatchCreativesToPlacement do
  let(:placement) { AdParameters::Entities::Placement.new(floor: 10, currency: "EUR", id: "plc-1") }
  let(:matching_creative) { AdParameters::Entities::Creative.new(price: 15, currency: "EUR", id: "video-1") }
  let(:not_matching_creative) { AdParameters::Entities::Creative.new(price: 5, currency: "EUR", id: "video-2") }

  describe "#call" do
    subject(:matching_creatives) { described_class.new(placement:, creatives: [matching_creative, not_matching_creative]).call }

    it 'matches the creative above the floor price' do
      expect(matching_creatives).to include(matching_creative)
    end

    it 'does not match the creative belov the floor price' do
      expect(not_matching_creative).not_to include(matching_creative)
    end
  end
end
