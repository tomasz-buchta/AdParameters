module AdParameters
  class CurrencyExchange
    RATES = {
      "EUR" => {
        "SEK" => 11.19, # From google
        "TYR" => 3.31,
        "USD" => 1.13,
        "EUR" => 1.0
      }
    }

    def self.rate_for_currency(from:, to: )
      RATES[to][from]
    end
  end
end
