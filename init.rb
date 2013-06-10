require 'redmine'

Redmine::Plugin.register :redmine_custom_field_hints do
  name 'Redmine Custom Field Hints'
  author 'Brett Patterson'
  description 'Adds ability for custom fields to have hints'
  version '0.0.1'

  requires_redmine :version_or_higher => '2.0.3'
end

require 'redmine_custom_field_hints/hooks/redmine_custom_field_hints_hooks'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'custom_fields_helper'
  unless CustomFieldsHelper.included_modules.include?(RedmineCustomFieldHints::Patches::CustomFieldsHelperPatch)
    CustomFieldsHelper.send(:include, RedmineCustomFieldHints::Patches::CustomFieldsHelperPatch)
  end
  
  # require_dependency 'issue_category'
  # unless IssueCategory.included_modules.include?(RedmineCategoryTree::Patches::IssueCategoryPatch)
  #   IssueCategory.send(:include, RedmineCategoryTree::Patches::IssueCategoryPatch)
  # end

  # require_dependency 'issues_controller'
  # unless IssuesController.included_modules.include?(RedmineCategoryTree::Patches::IssuesControllerPatch)
  #   IssuesController.send(:include, RedmineCategoryTree::Patches::IssuesControllerPatch)
  # end

  # require_dependency 'issue_categories_controller'
  # unless IssueCategoriesController.included_modules.include?(RedmineCategoryTree::Patches::IssueCategoriesControllerPatch)
  #   IssueCategoriesController.send(:include, RedmineCategoryTree::Patches::IssueCategoriesControllerPatch)
  # end

  # require_dependency 'project'
  # unless Project.included_modules.include?(RedmineCategoryTree::Patches::ProjectPatch)
  #   Project.send(:include, RedmineCategoryTree::Patches::ProjectPatch)
  # end
  # 
  # require_dependency 'reports_controller'
  # unless ReportsController.included_modules.include?(RedmineCategoryTree::Patches::ReportsControllerPatch)
  #   ReportsController.send(:include, RedmineCategoryTree::Patches::ReportsControllerPatch)
  # end

  # require_dependency 'queries_helper'
  # unless QueriesHelper.included_modules.include?(RedmineCategoryTree::Patches::QueriesHelperPatch)
  #   QueriesHelper.send(:include, RedmineCategoryTree::Patches::QueriesHelperPatch)
  # end
end
