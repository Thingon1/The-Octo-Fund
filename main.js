(function(){$(window).load(function(){var e,a;return $("main").addClass("intro"),setTimeout(function(){return $("main").addClass("login")},4750),e="",a=[{name:"Tito",code:"e097caa873b4a38a159883245d5d984524d36ded0b9fb63ca55d2c7aa5656a77cab36b38fe999bae0b5f62a398b2be3700ffc58b64d8ef8fc75a9b4b396c84f7"},{name:"Jason",code:"ab330d69779fa55198fc42c14181b585ff3bbcf9372943d0dfaf78d13694c3d4b6d6f67ae3c0cb91ab99ff76b47162c2fbb720332d8379bab3e5cd5ab7977523"},{name:"Madeline",code:"5ed98af95db1ad9f7982c2449253ddfa6c6cad1e93fb83c52cfcffe7b195ceeab834a25405d90c7165f38c6ba1ad386ce2fdc2e3979e59fcee2fc1d28132d9b1"}],$(".access-code input").keyup(function(){var c,t,n;if($(this).val().length<10&&(this.style.width=2.125*(this.value.length+1)+"em"),10===$(this).val().length){for($("input").blur(),e=$(this).val(),c=CryptoJS.SHA512(e).toString(),t=0,n=!1;t<a.length;)c===a[t].code?(sessionStorage.setItem("status","loggedIn"),n=!0,$(".js-custom-name").text(a[t].name)):e="",t++;return!0===n?($("main").addClass("welcome"),setTimeout(function(){return $("main").fadeOut(500,function(){return window.location.href="/Welcome.html"})},6e3)):$(".access-code").addClass("js-incorrect")}}),$(".access-code input").focusout(function(){return this.value.length===this.maxLength?$(this).removeClass("js-invalid-input"):$(this).addClass("js-invalid-input")}),$(".access-code input").focus(function(){return $(this).removeClass("js-invalid-input"),$(".access-code").removeClass("js-incorrect")})})}).call(this);