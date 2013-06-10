class AddCustomFieldHintColumn < ActiveRecord::Migration
  def self.up
    add_column :custom_fields, :redmine_custom_field_hint, :text, :null => true
  end
  
  def self.down
    remove_column :custom_fields, :redmine_custom_field_hint
  end
end