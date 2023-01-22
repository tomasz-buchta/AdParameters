require "spec_helper"

RSpec.describe AdParameters::CurrencyExchange do
  subject { described_class }

  describe ".rate_for_currency" do
    it { expect(described_class.rate_for_currency(from: "SEK", to: "EUR")).to eq(11.19) }
  end
end
