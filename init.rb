require 'redmine'

Redmine::Plugin.register :redmine_custom_field_hints do
  name 'Redmine Custom Field Hints'
  author 'Brett Patterson'
  description 'Adds ability for custom fields to have hints'
  version '0.0.4'

  requires_redmine :version_or_higher => '2.5.0'
end

require 'redmine_custom_field_hints/hooks/redmine_custom_field_hints_hooks'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'custom_fields_helper'
  unless CustomFieldsHelper.included_modules.include?(RedmineCustomFieldHints::Patches::CustomFieldsHelperPatch)
    CustomFieldsHelper.send(:include, RedmineCustomFieldHints::Patches::CustomFieldsHelperPatch)
  end
end
