Redmine Custom Field Hints
==========================

Adds hints to custom fields for Redmine

= Installation =

Follow normal Redmine Plugin installation instructions

= Usage =

When defining a custom input a "Hint Text" option will be available.  Enter the text you want to show as a hint for that input.

= User Experience =

When a user goes to add an issue, any input[type="text"] or textarea fields will appear to be prefilled with the value of the hint defined in the settings.

Once a user focuses the input, the text will disappear.  If they leave it empty (or what equates to empty after removing leading and trailing whitespace) or enter the same value as the autohint it will revert to the autohint text.  Any input that is not empty and doesn't match the autohint text will be left alone.

= Version History =

== 0.0.1 ==

Initial release of plugin
