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

  creatives = AdParameters::DataFactory.new(AdParameters::Entities::Creative, creative_nodes).build
  placements = AdParameters::DataFactory.new(AdParameters::Entities::Placement, placement_nodes).build

  # Assign creatives to placements
  mapped = placements.map{ |placement| [placement, AdParameters::MatchCreativesToPlacement.new(creatives:, placement:).call] }.to_h
  # And to serialize them
  seq = mapped.map do |placement, creatives|
    creatives_protobufs = creatives.map{ |c| FYBER::Userconfiguration::Creative.new(id: c.id, price: c.price_to_money.to_euro_amount.to_f) }
    FYBER::Userconfiguration::Placement.new(id: placement.id, creative: creatives_protobufs)
  end
  placement_seq = FYBER::Userconfiguration::PlacementSeq.new(placement: seq)
  puts placement_seq.to_json
end

# Run the main
main
