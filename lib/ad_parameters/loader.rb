require "zeitwerk"

module FYBER
end

module AdParameters
  class Loader
    def self.run
      loader = Zeitwerk::Loader.new # Code loader to avoid all the require statements
      loader.push_dir("lib/ad_parameters", namespace: AdParameters)
      loader.push_dir("lib/fyber", namespace: FYBER)
      loader.setup
    end
  end
end
