module RedmineCustomFieldHints
  module Patches
    module CustomFieldsHelperPatch
      def self.prepended(base) #:nodoc:
        base.class_eval do
          # TODO: Figure out why the method must be aliased and can't be overridden like a normal "prepend"
          alias_method :custom_field_tag_without_placeholder, :custom_field_tag
          alias_method :custom_field_tag, :custom_field_tag_with_placeholder
        end
      end

      # def custom_field_tag(prefix, custom_value)
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