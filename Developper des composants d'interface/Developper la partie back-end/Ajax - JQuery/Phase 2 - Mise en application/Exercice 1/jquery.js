$(document).ready(function() {
    $("#btn1").click(function() {

        $("#div1").load("partiel1.html");
    });

    $("#btn2").click(function() {

        $("#div1").load("partiel2.html");
    });
    $("#btn3").click(function() 
	{		
		$.post({
			url: "listeproduits.php", 
			dataType: "json",
			success: function(data) 
			{			
				var contenu = '';
				
				$.each(data, function(key, val) {
		             contenu += val.disc_id+" | "+val.disc_title+" | "+val.disc_year+"<br>";
		        });
		        								
				$("#div1").html(contenu);
			}
		});		
	});
});