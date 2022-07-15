module Phlex
  module Compiler
    def initialize(**kwargs)
      kwargs.keys.each do
        instance_variable_set("#{_1}", CallChainCollector.new(_1))
      end
    end

    def self.included(klass)
      (klass.instance_methods - StaticComponent.instance_methods).each do |m|
        klass.define_method(m) { CallChainCollector.new(m) }
      end
    end

    def content(&)
      raw '#{content(&)}'
    end
  end
end
