$(function () {
    $('#themes').change(function () {
        var item = $(':selected').val();
        changeTheme(item);

        $('.styleInfo').html("Currently viewing <a href='/css/" + item + ".css'>" + item + "</a>");
    });
});

function changeTheme(theme) {
    var stylshit = $('[title="hakyll_theme"]');
        stylshit.attr('href','/css/'+theme.toLowerCase()+'.css');
}

