$ -> 
	setTimeout(hideFlashMessages, 2000)

hideFlashMessages = -> 
	$("div.alert").fadeOut(2000)