# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: creative.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("creative.proto", :syntax => :proto2) do
    add_message "FYBER.userconfiguration.Creative" do
      required :id, :string, 1
      required :price, :float, 2
    end
  end
end

module FYBER
  module Userconfiguration
    Creative = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("FYBER.userconfiguration.Creative").msgclass
  end
end