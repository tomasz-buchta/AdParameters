require "nokogiri"

module AdParameters
  module Support
    class XmlReader
      def initialize(file_path)
        @file_path = file_path
        @doc = File.open(file_path) { |f| Nokogiri::XML(f) }
      end

      def creative_nodes
        doc.xpath("//Creative")
      end

      def placement_nodes
        doc.xpath("//Placement")
      end

      attr_reader :doc, :file_path
    end
  end
end
