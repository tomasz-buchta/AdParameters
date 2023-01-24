# frozen_string_literal: true

require "spec_helper"

RSpec.describe AdParameters::Entities::Creative do
  subject { described_class.new(price: 10, currency: "EUR", id: "video-1") }
  it { expect(subject.price_to_money).to be_a(AdParameters::Money) }
end
