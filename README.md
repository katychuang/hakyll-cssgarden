## hakyll-cssgarden

Description: This collection of styles aims to help haskell bloggers set up beautiful blogs with Hakyll static site generator by showcasing available themes.

> For themes with custom `site.hs`, consider the [hakyll-themes](http://github.com/katychuang/hakyll-themes) repo.

* [Take me to the gallery with thumbnails](http://katychuang.com/hakyll-cssgarden/gallery)
* [Take me to examples of hakyll site sources](http://github.com/katychuang/hakyll-themes) repo.

> The examples in `default_theme` are using CSS to edit the default, out-of-the-box version of `site.hs` and `templates/*.html` that are created.
> The example in `gallery` is used to generate the gallery site.

![](hakyllCSSGarden_preview.png)

## Installation & Setup

To preview the themes locally, you can follow these steps:

1. Install hakyll 
    * with stack or
    * with cabal `cabal install hakyll` or 
    * with nix `nix-shell -p '(haskellPackages.ghcWithPackages (pkgs: with pkgs; [ hakyll ]))'`
2. clone this repo
3. cd into `default_theme`
4. compile `ghc --make site.hs`
4. run server with `./site watch` 

# Contributing

It's through community contributions that will continue to improve this collection. You can contribute in several ways.

* **Submitting theme**: If you'd like to contribute your theme, fork the repo, create a new css file with your theme and place it in `default_theme/css`. 
    * if you're using the out of the box site.hs and template files: add the file to the css directory under `default_theme` and add an option to the dropdown menu in default.html
    * if you're contributing a whole new theme with a custom `site.hs` file, please consider contributing to [hakyll-themes](http://github.com/katychuang/hakyll-themes)

* **Issues**: Provide a detailed report of any bugs you encounter, and open an issue on GitHub.

* **Documentation**: If you'd like to fix a typo or enhance the docs, you can fork the project, make your changes, and submit a pull request. 

* **Code**: Make a fix and submit it as a pull request.

# Author

Katherine Chuang

* [http://github.com/katychuang](http://github.com/katychuang)
* [http://katychuang.com](http://katychuang.com)

# Thanks

[Jasper Van der Jeugt](https://github.com/jaspervdj) for [Hakyll](https://jaspervdj.be/hakyll/index.html)

[Hakyll-cssgarden Contributors](https://github.com/katychuang/hakyll-cssgarden/pulls?q=is%3Apr+is%3Aclosed)

# Copyright and license

* Copyright 2015-2017 Katherine Chuang
* Code released under the MIT License
