require "bundler/setup"
require "zeitwerk"
require "nokogiri"
loader = Zeitwerk::Loader.new # Code loader to avoid all the require statements
loader.setup

module AdParameters
end

require_relative 'creative'

class XmlReader
  def run
    file_path = './example.xml'
    doc = File.open(file_path) { |f| Nokogiri::XML(f) }
  end
end

def main
  xml_reader = XmlReader.new
  doc = xml_reader.run
  puts doc.to_s
end

# Run the main
main
