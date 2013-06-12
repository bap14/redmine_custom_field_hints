var RedmineCustomFieldAutohinter = function (element)
{
	this.element = jQuery(element);
	console.info('Binding to element #' + this.element.attr('id'));
	this.autoHintText = this.element.attr('data-autohint');
	this.tagName = this.element.prop('tagName');
	
	this.element.on('focus', null, null, jQuery.proxy(this.onFocusCallback, this));
	this.element.on('blur', null, null, jQuery.proxy(this.onBlurCallback, this));
	this.element.parents('form').on('submit', null, null, jQuery.proxy(this.onFormSubmit, this));
	
	this.element.data('RedmineCustomFieldAutohinterInitialized', true);
	
	this.onBlurCallback();
};

RedmineCustomFieldAutohinter.prototype = {
	onFocusCallback: function ()
	{
		if (jQuery.trim(this.element.val()) === jQuery.trim(this.autoHintText))
		{
			this.element.val('');
			this.element.removeClass('autohinted');
		}
	},
	
	onBlurCallback: function ()
	{
		if (
			jQuery.trim(this.element.val()) === jQuery.trim(this.autoHintText) ||
			jQuery.trim(this.element.val()).length == 0
		)
		{
			this.element.val(this.autoHintText);
			this.element.addClass('autohinted');
		}
	},
	
	onFormSubmit: function ()
	{
		this.onFocusCallback();
	}
};

RedmineCustomFieldAutohinter.bindToInputs = function ()
{
	jQuery('input[data-autohint], textarea[data-autohint]').each(
		function (idx, elem)
		{
			if (jQuery(elem).data('RedmineCustomFieldAutohinterInitialized') !== true)
			{
				new RedmineCustomFieldAutohinter(elem);
			}
		}
	);
};

jQuery(document).ready(
	function ()
	{
		jQuery(document).ajaxSuccess(RedmineCustomFieldAutohinter.bindToInputs);
		RedmineCustomFieldAutohinter.bindToInputs();
	}
);