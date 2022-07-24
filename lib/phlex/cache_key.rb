# frozen_string_literal: true

module Phlex
  class CacheKey
    def initialize(*key)
      @value = Array(normalize(key)).flatten.join("/")
    end

    def to_s
      @value
    end

    private

    def normalize(key)
      if key.respond_to? recursion_method
        normalize key.public_send(recursion_method)
      elsif key.is_a? Enumerable
        key.map { normalize _1 }
      else
        key.to_s
      end
    end

    def recursion_method
      self.class.name.demodulize.underscore
    end
  end

  CacheVersion = Class.new(CacheKey)
end
