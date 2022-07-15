module Phlex
  class StaticComponent < Component
    def call
      return super if is_a? Compiler
      if respond_to? :compiled_template
        compiled_template(&@content)
      else
        compile_template
        call
      end
    end

    def compile_template
      compiler_class = Class.new(self.class).include(Compiler)
      compiler = compiler_class.new(**assigns)

      self.class.class_eval(<<-RUBY, __FILE__, __LINE__ + 1)
        def compiled_template(&)
          %{#{compiler.call}}
        end
      RUBY
    end
  end
end
