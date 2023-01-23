require "bundler/setup"
require "zeitwerk"
require "nokogiri"
require_relative "ad_parameters/loader"

module AdParameters
end

class XmlReader
  def run
    file_path = './example.xml'
    doc = File.open(file_path) { |f| Nokogiri::XML(f) }
  end
end

def main
  # TODO: Handle file input / STDIN
  AdParameters::Loader.run
  # TODO: Refactor the creation
  xml_reader = XmlReader.new
  doc = xml_reader.run
  creative_nodes = doc.xpath("//Creative")
  placement_nodes = doc.xpath("//Placement")

  creatives = AdParameters::DataFactory.new(AdParameters::Creative, creative_nodes).build
  placements = AdParameters::DataFactory.new(AdParameters::Placement, placement_nodes).build

  mapped = placements.map{ |placement| [placement, AdParameters::MatchCreativesToPlacement.new(creatives:, placement:).call] }.to_h
end

# Run the main
main
