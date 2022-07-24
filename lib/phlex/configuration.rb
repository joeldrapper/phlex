# frozen_string_literal: true

module Phlex
  class Configuration
    attr_accessor :convert_underscores_to_dashes

    def initialize
      @convert_underscores_to_dashes = true
    end
  end
end
