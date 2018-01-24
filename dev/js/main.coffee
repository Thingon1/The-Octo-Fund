$(window).load ->

	# Intro animation
	$("main").addClass("intro")

	setTimeout ( ->
		$("main").addClass("login")
	), 4750

	#used to combine input values into one access string
	code = '' 

	#list of hashed codes
	hashedPass = [
		{name:'Tito', code:"e097caa873b4a38a159883245d5d984524d36ded0b9fb63ca55d2c7aa5656a77cab36b38fe999bae0b5f62a398b2be3700ffc58b64d8ef8fc75a9b4b396c84f7"},
		{name:'Jason', code:"ab330d69779fa55198fc42c14181b585ff3bbcf9372943d0dfaf78d13694c3d4b6d6f67ae3c0cb91ab99ff76b47162c2fbb720332d8379bab3e5cd5ab7977523"},
		{name:'Madeline', code:"5ed98af95db1ad9f7982c2449253ddfa6c6cad1e93fb83c52cfcffe7b195ceeab834a25405d90c7165f38c6ba1ad386ce2fdc2e3979e59fcee2fc1d28132d9b1"}
	]

	$('.access-code input').keyup ->

		if $(this).val().length < 10
			@style.width = (@value.length + 1) * 2.125 + 'em'
		
		#autotab password input field
#		if @value.length == @maxLength
#			$(this).addClass('js-enter')
#			$(this).next('input').addClass('js-enter')
#			$(this).next('input').focus()

#		inputValidate = true

		#check to see if all items are complete
#		$('.access-code input').each (index, element) ->
#			if $(element).val() == ''
#			  inputValidate = false
#			return

		#submit and check access code
#		if inputValidate

		if $(this).val().length == 10
			#loose focus on input
			$('input').blur()

			# combine inputs into one string
#			$('.access-code input').each (index, element) ->
#				code = code + $(this).val()
	
			code = $(this).val()

			#encrypt access string 
			encrypted = CryptoJS.SHA512(code).toString()

			# check encrypted access string against pass database
			i = 0
			validated = false
			while i < hashedPass.length
				
				if encrypted == hashedPass[i].code
					#set login for user
					sessionStorage.setItem('status','loggedIn')

					validated = true

					#set custom name to display
					$('.js-custom-name').text(hashedPass[i].name)

				else
					#reset code string
					code = ''

				i++

			#add UI class to form
			if validated is true
				$('main').addClass('welcome')

				#redirect to logged in page, wait afer #welcome-message
				setTimeout (->
					$('main').fadeOut 500, ->
						window.location.href = '/Welcome.html'
				), 6000

			else
				$('.access-code').addClass('js-incorrect')


	#add class if field is left empty
	$('.access-code input').focusout ->
		if @value.length == @maxLength
			$(this).removeClass('js-invalid-input')
		else
			$(this).addClass('js-invalid-input')

	#remove UI classes so user can try again
	$('.access-code input').focus ->
		
		$(this).removeClass('js-invalid-input')
		$('.access-code').removeClass('js-incorrect')