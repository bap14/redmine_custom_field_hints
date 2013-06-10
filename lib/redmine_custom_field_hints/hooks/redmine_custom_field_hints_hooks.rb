module RedmineCustomFieldHints
  module Hooks
    class RedmineCustomFieldHintsHooks < Redmine::Hook::ViewListener
      def view_custom_fields_form_upper_box (context = {})
        if context[:custom_field].class.name == "IssueCustomField"
          context[:controller].send(
            :render_to_string,
            {
              :formats => [:html],
              :partial => 'redmine_custom_field_hints/custom_field_hints',
              :locals => context
            }
          )
        end
      end
      
      def controller_custom_fields_edit_after_save (context = {})
        context[:custom_field].update_column('redmine_custom_field_hint', context[:params][:redmine_custom_field_hint])
      end
      
      def view_layouts_base_html_head(context = {})
        retval = stylesheet_link_tag 'redmine_custom_field_hints.css', :plugin => 'redmine_custom_field_hints'
        retval += javascript_include_tag 'redmine_custom_field_hints', :plugin => 'redmine_custom_field_hints'
        
        retval
      end
    end
  end
end