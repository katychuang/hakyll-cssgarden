var themes =  [ "composeconference"
              , "haskell.org"
              , "bronx"
              , "brooklyn"
              , "heraldsquare"
              , "queens"
              ];


function save(url, filename){
    var page = require('webpage').create();
    page.settings.userAgent = 'WebKit/534.46 Mobile/9A405 Safari/7534.48.3';
    page.viewportSize = { width: 1024, height: 768 };
    page.clipRect = { top: 0, left: 0, width: 1024, height: 768 };
 
  page.open(url, function(status) {
      if ( status == 'success' ) {
          console.log(filename);
          page.render(filename);
      } else {
        page.close();
      }
    });

}

function savePages(domain, theme) {
  var pages = ["", "about.html", "contact.html", "archive.html"];

  for (var i in pages){
    var src = domain + pages[i];
    var url = src + "?theme=" + theme;
    save(url, theme + "-" + pages[i] + ".png");
  }
}

for (var t in themes){
  var domain = "http://localhost:8000/";
  savePages(domain, themes[t]);
}      
phantom.exit();

