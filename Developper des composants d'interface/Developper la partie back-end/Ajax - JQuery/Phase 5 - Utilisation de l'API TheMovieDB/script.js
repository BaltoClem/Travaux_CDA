
$('#submit').click(function() {

    let search = $("#search").val();
    console.log(search);
    $.getJSON("http://api.themoviedb.org/3/search/movie?api_key=f33cd318f5135dba306176c13104506a&query=") + search, function (data){
        var items = [];
        $.each(data.results, function(key, val) {
            items.push(key + ' : ' + val.title + '<br />');
        });
    $('#result').html(items.join());
    }
});