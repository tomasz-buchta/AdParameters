# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: placement.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("placement.proto", syntax: :proto2) do
    add_message "FYBER.userconfiguration.Placement" do
      required :id, :string, 1
      repeated :creative, :message, 2, "FYBER.userconfiguration.Creative"
    end
  end
end

module FYBER
  module Userconfiguration
    Placement = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("FYBER.userconfiguration.Placement").msgclass
  end
end
