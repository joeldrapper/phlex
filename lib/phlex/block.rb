# frozen_string_literal: true

module Phlex
  class Block
    include Callable

    def initialize(context, &block)
      @context = context
      @block = block
    end

    def call(target, *args, **kwargs)
      @context.render_block(target, *args, **kwargs, &@block)
    end
  end
end
