module RedmineCustomFieldHints
  module Patches
    module CustomFieldsHelperPatch
      def self.included(base) #:nodoc:
        base.send(:prepend, RedmineCustomFieldHints::Patches::CustomFieldTagWithPlaceholder)
        base.class_eval do
          unloadable

          # TODO: figure out why "prepend" doesn't work to allow custom_field_tag to be redefined
          alias_method :custom_field_tag_without_placeholder, :custom_field_tag
          alias_method :custom_field_tag, :custom_field_tag_with_placeholder
        end
      end
    end

    module CustomFieldTagWithPlaceholder
      #def custom_field_tag(prefix, custom_value)
      #  custom_value.custom_field.format.edit_tag self,
      #      custom_field_tag_id(prefix, custom_value.custom_field),
      #      custom_field_tag_name(prefix, custom_value.custom_field),
      #      custom_value,
      #      {:class => "#{custom_value.custom_field.field_format}_cf2",
      #       :placeholder => custom_value.custom_field.redmine_custom_field_hint || ""}
      #end
      def custom_field_tag_with_placeholder(prefix, custom_value)
        custom_value.custom_field.format.edit_tag self,
            custom_field_tag_id(prefix, custom_value.custom_field),
            custom_field_tag_name(prefix, custom_value.custom_field),
            custom_value,
            {:class => "#{custom_value.custom_field.field_format}_cf",
             :placeholder => custom_value.custom_field.redmine_custom_field_hint || ""}
      end
    end
  end
end