# frozen_string_literal: true

module Phlex
  module Node
    include Callable

    def children
      @_children ||= []
    end

    def call(buffer = String.new)
      children.each { _1.call(buffer) }
      buffer
    end
  end
end
