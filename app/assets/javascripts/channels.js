var ready = function () {
	
	/**
	 * When someone selects a channel, the channel is retrieved and displayed on the page.
	 */

	$('.switch-channel').click(function (e) {
		e.preventDefault();

		var channel_id = $(this).data('channelid');

		$.get("channels/" + channel_id, function(data) {
			$("#channelBox").html(data);
			}, "html");
	});

	/**
	 * Listens to text box and submits the form if enter is pressed.
	 */
	$(document).on('keydown', '.channeltextarea', function (e) {
		if (event.keyCode == 13 && event.shiftKey == 0) {
			event.preventDefault();

			var textBox = $('.channeltextarea')

			var message = textBox.val();
			message = message.replace(/^\s+|\s+$/g, "");

			if (message != '') {
				$('#channel_form').submit();
				textBox.val('');
				textBox.focus();
			}
		}
		
	});
}


$(document).ready(ready);
$(document).on("page:load", ready);