# frozen_string_literal: true

require "spec_helper"

RSpec.describe AdParameters::Support::CurrencyExchange do
  subject { described_class }

  describe ".rate_for_currency" do
    subject { described_class.rate_for_currency(from: "EUR", to: "SEK") }
    it { is_expected.to eq(11.19) }
    it { is_expected.to be_a(BigDecimal) }

    context "with unknown currency" do
      subject { described_class.rate_for_currency(from: "EUR", to: "XXX") }
      it { expect{ subject }.to raise_exception(ArgumentError) }
    end
  end

  describe ".convert" do
    it { expect(described_class.convert(amount: 10, from: "EUR", to: "SEK")).to be_within(0.01).of(BigDecimal("111.9")) }
    it { expect(described_class.convert(amount: 10, from: "SEK", to: "EUR")).to be_within(0.01).of(BigDecimal("0.8936")) }
  end
end
