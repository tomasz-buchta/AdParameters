require "spec_helper"

require "ad_parameters/data_factory"
require "ad_parameters/creative"
require "nokogiri"

RSpec.describe AdParameters::DataFactory do
  subject(:data_factory) { described_class.new(klass, xml_nodes) }

  let(:xml_nodes) do
    Nokogiri::XML('
  <root>
    <Creatives>
      <Creative id="video-1" price="6.4567" currency="EUR"/>
    </Creatives>
    </root>').xpath("//Creative")
  end

  let(:klass) { AdParameters::Creative }

  describe "#build" do
    subject(:output) { data_factory.build }
    it { expect(output.count).to eq(1) }
    it { expect(output.first).to be_a(AdParameters::Creative) }
    it { expect(output.first).to have_attributes(id: "video-1", price: "6.4567", currency: "EUR") }
  end
end
