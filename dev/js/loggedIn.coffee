$(window).load ->

	#check login of user
	if (sessionStorage.getItem('status') != 'loggedIn')
		window.location.href = '/index.html'

	