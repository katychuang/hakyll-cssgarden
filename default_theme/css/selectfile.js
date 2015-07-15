$(function () {
  var query = location.search.substr(1);
  var s = "";
  var tValue = "default";
  query.split("&").forEach(function(part) {
    var item = part.split("=");
    s += " " + item;
    if (item[0] == "theme"){
      tValue = item[1];
    }
  });
  
  changeTheme(tValue);
  updateLinks(tValue);

  if (window.location.href.indexOf("posts") >= 0){
    $('[title="hakyll_theme"]').attr('href','../css/'+tValue.toLowerCase()+'.css');
  } else {
  $('.styleInfo').html("Currently viewing <a href='./css/" + tValue + ".css'>" + tValue + "</a> ; ");
  }

  $('#themes').change(function () {
      var item = $(':selected').val();
      window.location= location.search.split('?')[0] +'?theme=' + item;
  });
});

function changeTheme(theme) {
    var stylshit = $('[title="hakyll_theme"]');
        stylshit.attr('href','./css/'+theme.toLowerCase()+'.css');
}

function updateLinks(theme) {
  $.each(
    $('a'), function(index, value) {
      $(value).attr('href', $(value).attr('href') + '?theme=' + theme);
    }
  );
}
