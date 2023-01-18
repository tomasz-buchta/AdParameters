require "bundler/setup"
require "zeitwerk"
loader = Zeitwerk::Loader.new # Code loader to avoid all the require statements
loader.setup

module AdParameters
end
