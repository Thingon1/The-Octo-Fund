(function(){$(window).load(function(){var s;return $("main").addClass("intro"),setTimeout(function(){return $("main").addClass("login")},4750),s="",$(".access-code input").keyup(function(){var t,o,e;if($(this).val().length<10&&(this.style.width=2.125*(this.value.length+1)+"em"),10===$(this).val().length){for($("input").blur(),s=$(this).val(),t=CryptoJS.SHA512(s).toString(),o=0,e=!1;o<hashedPass.length;)t===hashedPass[o].code?(sessionStorage.setItem("status","loggedIn"),e=!0,$(".js-custom-name").text(hashedPass[o].name)):s="",o++;return!0===e?($("main").addClass("welcome"),setTimeout(function(){return $("main").fadeOut(500,function(){return window.location.href="/Welcome.html"})},6e3)):$(".access-code").addClass("js-incorrect")}}),$(".access-code input").focusout(function(){return this.value.length===this.maxLength?$(this).removeClass("js-invalid-input"):$(this).addClass("js-invalid-input")}),$(".access-code input").focus(function(){return $(this).removeClass("js-invalid-input"),$(".access-code").removeClass("js-incorrect")}),$(".js-toggle-request").on("click",function(){return $(this).blur,$("main").toggleClass("req-open")}),$(".back-to-top").on("click",function(){return $("html, body").animate({scrollTop:0},"slow")}),$(window).on("scroll",function(){return $(".logo h1").toggleClass("js-scroll",$(window).scrollTop()>0),$(window).scrollTop()>$("#social").offset().top?$(".back-to-top").addClass("js-scroll"):$(".back-to-top").removeClass("js-scroll")})})}).call(this);