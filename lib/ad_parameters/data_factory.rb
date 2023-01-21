# Will build data object from xml node set
module AdParameters
  class DataFactory
    def initialize(klass, nodes)
      @klass = klass
      @nodes = nodes
    end

    def build
      members = klass.members
      nodes.map do |node|
        values = members.map { |member| [member, node.attr(member)] }.to_h
        klass.new(**values)
      end
    end

    attr_reader :klass, :nodes
  end
end
