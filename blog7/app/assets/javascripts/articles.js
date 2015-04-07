$(document).ready(function() {
	
	$("#cr_art").one("click", function (e) {
		e.preventDefault();
		$("form").find("input[type=text]").val("")
		$("textarea").val("")

		var request = $.ajax({ url: $(this).attr("href"), type: "get"});

		request.done(function(response){
			$(".cr_artshow").append(response);
		});
	});

	$(".cr_artshow").on("submit", "form", function (e) {
		e.preventDefault();
		// window.alert("hello")

		var link = $(this).attr("action");
		var data = $(this).serialize();

		$(".cr_artshow").bPopup().close()

		var request = $.ajax({url: link, data: data, type: "post", dataType: "JSON"});

			request.done(function(data){
				$(".sect_show").append(data)
		var new_link = "<li><a href=/articles/" + data.id + ">"+ data.title + "</li>";
				$("ul").append(new_link);
				$("form").find("input[type=text]").val("")
				$("textarea").val("")

			});

	});
})



$(".cr_artshow").ready(function() {
	$("#cr_art").on("click", function (e) {
			e.preventDefault();
	$(".cr_artshow").bPopup({
											appendTo: 'body'
											, zIndex: 2
											, opacity: 0.6
											, modalClose: true
											, transition: 'slideIn'
			});
	});
});