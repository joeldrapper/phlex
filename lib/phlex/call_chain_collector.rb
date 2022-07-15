module Phlex
  class CallChainCollector < BasicObject
    def initialize(value)
      @value = value
    end

    def to_s
      "#\{#{@value}}"
    end

    def method_missing(method_name, *args)
      @value << "." << method_name.name
      self
    end
  end
end

