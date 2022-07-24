# frozen_string_literal: true

module Phlex
  class CacheableObject < SimpleDelegator
    include Cacheable

    def cacheable_object
      __getobj__
    end
  end
end
