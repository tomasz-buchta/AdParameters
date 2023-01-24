# frozen_string_literal: true

module AdParameters
  module Buildable
    def members
      schema.keys.map(&:name)
    end
  end
end
