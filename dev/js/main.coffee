$(window).load ->

	# Intro animation
	$("main").addClass("intro")

	setTimeout ( ->
		$("main").addClass("login")
	), 4750

	#used to combine input values into one access string
	code = '' 

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

	#open request tab
	$('.js-toggle-request').on 'click', ->
		$(this).blur
		$('main').toggleClass('req-open')

	#scroll back to top button
	$('.back-to-top').on 'click', ->
		$("html, body").animate({ scrollTop: 0 }, "slow")

	
	#hide logoname when scrolling
	$(window).on 'scroll', ->
		$('.logo h1').toggleClass 'js-scroll', $(window).scrollTop() > 0

		if $(window).scrollTop() > $('#social').offset().top
		    $('.back-to-top').addClass 'js-scroll'
		else
			$('.back-to-top').removeClass 'js-scroll'

  


