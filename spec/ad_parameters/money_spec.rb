require "spec_helper"

RSpec.describe AdParameters::Money do
  subject(:money) { described_class.new(amount: 10, currency: "EUR") }

  context "with same currency" do
    let(:other) { described_class.new(amount: 10, currency: "EUR") }
    it { expect(other <=> money).to eq(0) }

    context "with different amount" do
      let(:other) { described_class.new(amount: 15, currency: "EUR") }
      it { expect(other <=> money).to eq(1) }
    end
  end

  context "with different currency" do
    let(:other) { described_class.new(amount: 10, currency: "USD") }
    it { expect(other <=> money).to eq(-1) }
  end
end
