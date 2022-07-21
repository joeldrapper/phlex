# frozen_string_literal: true

module Phlex
  class Tag
    DASH = "-"
    SPACE = " "
    UNDERSCORE = "_"
    NAMESPACE_DELINEATOR = "::"

    attr_reader :name

    def initialize(name, **attributes)
      @name = name
      @classes = String.new
      self.attributes = attributes
    end

    def attributes=(attributes)
      self.classes = attributes.delete(:class)
      @attributes = attributes
    end

    def classes=(value)
      case value
      when String
        @classes << SPACE << value
      when Symbol
        @classes << SPACE << value.to_s
      when Array
        @classes << SPACE << value.join(SPACE)
      when nil
        return
      else
        raise ArgumentError, "Classes must be String, Symbol, or Array<String>."
      end
    end

    private

    def opening_tag_content
      name + attributes
    end

    def attributes
      attributes = @attributes.dup
      attributes[:class] = classes
      attributes.compact!
      attributes.transform_values! { ERB::Util.html_escape(_1) }
      attributes = attributes.map { |k, v| %Q(#{k}="#{v}") }.join(SPACE)
      attributes.prepend(SPACE) unless attributes.empty?
      attributes
    end

    def classes
      return if @classes.empty?
      @classes.gsub!(UNDERSCORE, DASH) if Phlex.configuration.convert_underscores_to_dashes
      @classes.strip!
      @classes
    end
  end
end
