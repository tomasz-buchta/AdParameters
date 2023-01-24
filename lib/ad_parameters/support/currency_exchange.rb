require "bigdecimal"

module AdParameters
  module Support
    class CurrencyExchange
      # TODO: Read this from configuration of sorts
      RATES = {
        "EUR" => {
          "SEK" => BigDecimal("11.19"), # From google
          "TYR" => BigDecimal("3.31"),
          "USD" => BigDecimal("1.13"),
          "EUR" => BigDecimal("1.0")
        }
      }

      # This will only provide SEK,TYR,USD to EUR exchange rate
      # In real system we would also want to provide SEK <-> TYR etc. if possible
      def self.rate_for_currency(from:, to:)
        # Try original direction - if not found try reverse
        raise ArgumentError, "Currency not supported" unless RATES.dig(from, to) || RATES.dig(to, from)

        RATES.dig(from, to) || 1 / RATES.dig(to, from)
      end

      def self.convert(amount:, from:, to:)
        amount * rate_for_currency(from:, to:)
      end
    end
  end
end
