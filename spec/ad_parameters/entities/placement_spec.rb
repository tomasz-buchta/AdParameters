require "spec_helper"

RSpec.describe AdParameters::Entities::Placement do
  subject { described_class.new(floor: 10, currency: "EUR", id: "plc-1") }
  it { expect(subject.floor_to_money).to be_a(AdParameters::Money) }
end
