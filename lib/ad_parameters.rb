require "bundler/setup"
require "zeitwerk"
require "nokogiri"
loader = Zeitwerk::Loader.new # Code loader to avoid all the require statements
loader.setup

module AdParameters
end

require_relative 'ad_parameters/creative'
require_relative 'ad_parameters/placement'

class XmlReader
  def run
    file_path = './example.xml'
    doc = File.open(file_path) { |f| Nokogiri::XML(f) }
  end
end

# Will build data object from xml node set
class DataFactory
  def initialize(klass, nodes)
    @klass = klass
    @nodes = nodes
  end

  def build
    members = AdParameters::Creative.members
    nodes.map do |node|
      values = members.map { |member| [member, node.attr(member)] }.to_h
      AdParameters::Creative.new(**values)
    end
  end

  attr_reader :klass, :nodes
end

def main
  xml_reader = XmlReader.new
  doc = xml_reader.run
  creative_nodes = doc.xpath("//Creative")
  placement_nodes = doc.xpath("//Placement")

  creatives = DataFactory.new(AdParameters::Creative, creative_nodes).build
  placements = DataFactory.new(AdParameters::Placement, placement_nodes).build
end

# Run the main
main
