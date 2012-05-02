$ -> 
	setTimeout(hideFlashMessages, 2000)

hideFlashMessages = -> 
	$("div.alert").slideUp(1000)