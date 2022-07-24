# frozen_string_literal: true

require 'delegate'

module Phlex
  module Cacheable
    def cache_key
      source_path
    end

    def cache_version
      Digest::MD5.hexdigest(
        source_file
      )
    end

    def source_file
      File.read(source_path)
    end

    def source_path
      if respond_to? :source_location
        source_location.first
      else
        const_source_location("::#{cacheable_object.name}", false).first
      end
    end

    def cacheable_object
      self
    end
  end
end
