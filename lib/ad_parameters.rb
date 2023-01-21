require "bundler/setup"
require "zeitwerk"
require "nokogiri"

module AdParameters
end

class XmlReader
  def run
    file_path = './example.xml'
    doc = File.open(file_path) { |f| Nokogiri::XML(f) }
  end
end

def main
  Loader.run
  xml_reader = XmlReader.new
  doc = xml_reader.run
  creative_nodes = doc.xpath("//Creative")
  placement_nodes = doc.xpath("//Placement")

  creatives = AdParameters::DataFactory.new(AdParameters::Creative, creative_nodes).build
  placements = AdParameters::DataFactory.new(AdParameters::Placement, placement_nodes).build
end

# Run the main
main
