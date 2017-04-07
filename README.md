## hakyll-cssgarden

Description: This collection of styles aims to help haskell bloggers set up beautiful blogs with Hakyll static site generator by showcasing available themes.

![](hakyllCSSGarden_preview.png)

## Installation & Setup

To preview the themes, you can follow these steps

1. Install hakyll `cabal install hakyll` or with nix `nix-shell -p '(haskellPackages.ghcWithPackages (pkgs: with pkgs; [ hakyll ]))'`
2. clone this repo
3. cd into `default_theme`
4. compile `ghc --make site.hs`
4. run server with `./site watch` 

# Contributing

It's through community contributions that will continue to improve this collection. You can contribute in several ways.

* *Submitting theme*: If you'd like to contribute your theme, fork the repo, create a new subdirectory with your theme and site.hs files. * if you're using the out of the box site.hs and template files: add the file to the css directory under `default_theme` and add an option to the dropdown menu in default.html

* *Issues*: Provide a detailed report of any bugs you encounter, and open an issue on GitHub.

* *Documentation*: If you'd like to fix a typo or enhance the docs, you can fork the project, make your changes, and submit a pull request. 

* *Code*: Make a fix and submit it as a pull request.

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
