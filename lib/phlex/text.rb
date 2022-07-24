# frozen_string_literal: true

module Phlex
  class Text
    include Callable

    def initialize(content)
      @content = content
    end

    def call(buffer = String.new)
      buffer << ERB::Util.html_escape(@content)
    end
  end
end
