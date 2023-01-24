require "nokogiri"

module AdParameters
  module Support
    class XmlReader
      def self.read(file_path)
        File.open(file_path) { |f| Nokogiri::XML(f) }
      end
    end
  end
end
