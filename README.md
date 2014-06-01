# ![](https://github.com/bpat1434/redmine_custom_field_hints/raw/master/docs/icon-small.png) Redmine Custom Field Hints

Adds functionality for text-based custom fields to have autohints defined for them which disappear when the user focuses the field. 

## Installation

Follow normal Redmine Plugin installation instructions

## Usage

When defining a custom input a "Hint Text" option will be available.  Enter the text you want to show as a hint for that input.

![Editing custom field screenshot](https://github.com/bpat1434/redmine_custom_field_hints/raw/master/docs/custom_field_edit.png)

You will be able to see what inputs have hint text supplied and what it is directly from the "Custom Fields" grid.

![Custom field grid screenshot](https://github.com/bpat1434/redmine_custom_field_hints/raw/master/docs/custom_fields_grid.png)

## User Experience

When a user creates or edits an issue, any field that has a hint defined will have that hint displayed in a light gray color.

![Issue edit custom field screenshot](https://github.com/bpat1434/redmine_custom_field_hints/raw/master/docs/custom_field_issue_edit.png)

When the user puts focus on that field, the contents disappear placing the cursor at the beginning of the input.  Once text has been entered, the user's input will remain.  If the user leaves the field empty, or what equates to being empty like only entering spaces, then the hinted text will appear and the contents will be truncated.

![Issue edit custom field focused screenshot](https://github.com/bpat1434/redmine_custom_field_hints/raw/master/docs/custom_field_issue_edit_focused.png)

# Version History

## 0.0.4

* Add support for Redmine 2.5.x

## 0.0.3

* Bug: Not all custom field types allow for hints to be defined

## 0.0.2

* Bug: Forms loaded via AJAX do not display autohints
* Bug: All inputs could have an autohint value even though it's not appropriate for them

## 0.0.1

Initial release of plugin
