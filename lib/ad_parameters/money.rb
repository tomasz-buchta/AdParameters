# frozen_string_literal: true

module AdParameters
  Money = Data.define(:amount, :currency) do
    include Comparable

    def <=>(other)
      return amount <=> other.amount if currency == other.currency

      to_euro_amount <=> other.to_euro_amount
    end

    # Naive approach - perform all money comparisons in EUR
    def to_euro_amount
      Support::CurrencyExchange.convert(amount:, from: currency, to: "EUR")
    end
  end
end
