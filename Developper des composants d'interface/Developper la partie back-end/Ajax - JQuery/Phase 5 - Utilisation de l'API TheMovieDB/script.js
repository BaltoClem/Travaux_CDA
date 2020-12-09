$('#submit').click(function() {

    let search = $("#search").val();
    $.getJSON("http://api.themoviedb.org/3/search/movie?api_key=f33cd318f5135dba306176c13104506a&query="+search, function (data){
        var items = [];
        $.each(data.results, function(key, val) {
            items.push('<br />' + key + ' : ' + val.original_title + '<br />' + val.release_date + '<br />' + 
            '<img src="http://image.tmdb.org/t/p/w185' + val.poster_path + '">');
        });
    $('#result').html(items.join());
});
});