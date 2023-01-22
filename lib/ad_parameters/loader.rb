require "zeitwerk"

module AdParameters
  class Loader
    def self.run
      loader = Zeitwerk::Loader.new # Code loader to avoid all the require statements
      loader.push_dir("lib/ad_parameters", namespace: AdParameters)
      loader.setup
    end
  end
end
