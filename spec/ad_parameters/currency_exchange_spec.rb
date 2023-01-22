require "spec_helper"

RSpec.describe AdParameters::CurrencyExchange do
  subject { described_class }

  describe ".rate_for_currency" do
    subject { described_class.rate_for_currency(from: "EUR", to: "SEK") }
    it { is_expected.to eq(11.19) }
    it { is_expected.to be_a(BigDecimal) }
  end

  describe ".convert" do
    it { expect(described_class.convert(amount: 10, from: "EUR", to: "SEK")).to be_within(0.01).of(BigDecimal("111.9")) }
    it { expect(described_class.convert(amount: 10, from: "SEK", to: "EUR")).to be_within(0.01).of(BigDecimal("0.8936")) }
  end
end
