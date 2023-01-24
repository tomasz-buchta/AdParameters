require "zeitwerk"

module FYBER
end

module AdParameters
  # Class responsible for loading the code to avoid adding requires everywhere
  class Loader
    def self.run
      # Zeitwerk is a ruby code loader used by rails
      loader = Zeitwerk::Loader.new # Code loader to avoid all the require statements
      loader.push_dir("lib/ad_parameters", namespace: AdParameters)
      loader.push_dir("lib/fyber", namespace: FYBER)
      loader.setup
    end
  end
end
