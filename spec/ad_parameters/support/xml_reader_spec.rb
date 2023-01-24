require "spec_helper"

RSpec.describe AdParameters::Support::XmlReader do
  subject(:reader) { described_class.new("spec/support/example.xml") }

  describe "#creative_nodes" do
    subject(:creative_nodes) { reader.creative_nodes }

    it { expect(creative_nodes.length).to eq(5) }
    it { expect(creative_nodes).to be_a(Nokogiri::XML::NodeSet) }
  end

  describe "#placement_nodes" do
    subject(:placement_nodes) { reader.placement_nodes }

    it { expect(placement_nodes.length).to eq(8) }
    it { expect(placement_nodes).to be_a(Nokogiri::XML::NodeSet) }
  end
end
