// Some actions for when replying to a comment - get ID of
// comment to reply to, and focus user on the text box

(function() {
	var comment_links = document.getElementsByClassName('cta-comment-reply'),
	    reply_input = document.getElementById('comment_parent');

	for(var i = 0; i < comment_links.length; i++) {
	     comment_links[i].addEventListener('click', function(){
	     	var id = this.getAttribute('data-reply-to');
	     	reply_input.value = id;
	     	document.getElementById('comment_content').focus();
	     });
	}

}).call(this);
