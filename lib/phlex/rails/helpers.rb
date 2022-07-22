module Phlex
  module Rails
    module Helpers
      def render_page(...)
        page = "#{controller_name.classify}::#{action_name.classify}Page".constantize
        render html: component(page, ...)
      end

      def component(component, ...)
        component.new(...).call.html_safe
      end
    end
  end
end
