module RedmineCustomFieldHints
  module Hooks
    class RedmineCustomFieldHintsHooks < Redmine::Hook::ViewListener
      render_on(:view_custom_fields_form_upper_box, :partial => 'redmine_custom_field_hints/custom_field_hints', :layout => false)
      
      def controller_custom_fields_new_after_save (context = {})
        save_redmine_custom_field_hint context
      end
      
      def controller_custom_fields_edit_after_save (context = {})
        save_redmine_custom_field_hint context
      end
      
      def save_redmine_custom_field_hint (context = {})
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