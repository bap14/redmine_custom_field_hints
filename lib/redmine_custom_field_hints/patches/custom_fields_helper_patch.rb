module RedmineCustomFieldHints
  module Patches
    module CustomFieldsHelperPatch
      def self.included(base) #:nodoc:
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        
        base.class_eval do
          unloadable
          
          alias_method_chain :custom_field_tag, :redmine_custom_field_hint
        end
      end
      
      module ClassMethods
      end
      
      module InstanceMethods
        def custom_field_tag_with_redmine_custom_field_hint(name, custom_value)
          custom_field = custom_value.custom_field
          field_name = "#{name}[custom_field_values][#{custom_field.id}]"
          field_name << "[]" if custom_field.multiple?
          field_id = "#{name}_custom_field_values_#{custom_field.id}"
      
          tag_options = {:id => field_id, :class => "#{custom_field.field_format}_cf"}
          
          field_format = Redmine::CustomFieldFormat.find_by_name(custom_field.field_format)
          
          case field_format.try(:edit_as)
          when "bool"
          when "list"
          else
            if !custom_field.redmine_custom_field_hint.nil?
              tag_options[:data] = {} if tag_options[:data].nil?
              tag_options[:data][:autohint] = custom_field.redmine_custom_field_hint
            end
          end
          
          case field_format.try(:edit_as)
          when "date"
            text_field_tag(field_name, custom_value.value, tag_options.merge(:size => 10)) +
            calendar_for(field_id)
          when "text"
            text_area_tag(field_name, custom_value.value, tag_options.merge(:rows => 3))
          when "bool"
            hidden_field_tag(field_name, '0') + check_box_tag(field_name, '1', custom_value.true?, tag_options)
          when "list"
            blank_option = ''.html_safe
            unless custom_field.multiple?
              if custom_field.is_required?
                unless custom_field.default_value.present?
                  blank_option = content_tag('option', "--- #{l(:actionview_instancetag_blank_option)} ---", :value => '')
                end
              else
                blank_option = content_tag('option')
              end
            end
            s = select_tag(field_name, blank_option + options_for_select(custom_field.possible_values_options(custom_value.customized), custom_value.value),
              tag_options.merge(:multiple => custom_field.multiple?))
            if custom_field.multiple?
              s << hidden_field_tag(field_name, '')
            end
            s
          else
            text_field_tag(field_name, custom_value.value, tag_options)
          end
        end
      end
    end 
  end
end