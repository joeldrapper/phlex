# frozen_string_literal: true

module Phlex
  class Tag
    class VoidElement < Tag
      ELEMENTS = %w[
        area
        embed
        img
        input
        link
        meta
        param
        track
        col
      ].freeze

      def call(buffer = String.new)
        buffer << "<" << name << attributes << " />"
      end
    end
  end
end
