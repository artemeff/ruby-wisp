module Wisp
  module Rails
    class TemplateHandler
      def self.erb_handler
        @@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
      end

      def self.call template
        compiled_source = erb_handler.call(template)
        "Wisp.compile(begin;#{compiled_source};end)"
      end
    end
  end
end

ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler :wisp, Wisp::Rails::TemplateHandler
end
