---
title: cleanMagic-hakyll
tags: fixed-width
author: katychuang
authorurl: http://twitter.com/katychuang
cover: cleanMagic_hakyll-index.png
screens: cleanMagic_hakyll-index, cleanMagic_hakyll-about, cleanMagic_hakyll-archive, cleanMagic_hakyll-contact, cleanMagic_hakyll-index
demo: http://ismailmustafa.com
download: https://github.com/katychuang/CleanMagic-hakyll
---

# CleanMagic for Hakyll

This theme is a fork of [CleanMagicMedium-Jekyll](https://github.com/SpaceG/CleanMagicMedium-Jekyll) originally published by Lucas Gatsas.

It features a top navigation bar, and an area for beautiful header background images. Clean and serene, it's sure to give your posts an extra polish.

![Preview](https://raw.githubusercontent.com/SpaceG/spaceg.github.io/5f240c5e8b3f8e2cb9f776688466de651d5d8958/img/intro-theme-1.png)

Features a nice big header image to sweeten your page.

---

## Installation:

Clone the repo and compile the `site.hs` file.

```haskell
git clone https://github.com/katychuang/CleanMagic-hakyll.git
cd CleanMagic-hakyll
ghc --make site.hs
```

Then you can view your site locally with `./site rebuild && ./site watch`


Feel free to tweak site.hs and any of the files.

Note that this theme has specific features with requires a custom written [siteCtx context](https://github.com/katychuang/hakyll-cssgarden/blob/master/cleanMagic-hakyll/site.hs#L67), with specific fields mapped to the template fields. For example, $side_description$ is mapped below to "my beautiful blog"


```haskell
siteCtx :: Context String
siteCtx = 
    constField "baseurl" "http://localhost:8000" `mappend` 
    constField "site_description" "my beautiful blog" `mappend`
    constField "instagram_username" "katychuang.nyc" `mappend`
    constField "twitter_username" "katychuang" `mappend`
    constField "github_username" "katychuang" `mappend`
    constField "google_username" "katychuang" `mappend`
    defaultContext
```

Once you have the field strings written as how you'd like it, make sure that you're connecting this function where your pages are being rendered, for example in creating the `index.html` page, you want to include it, similar to the following ([ref](https://github.com/katychuang/hakyll-cssgarden/blob/master/cleanMagic-hakyll/site.hs#L51)): 

```haskell
match "index.html" $ do
    route idRoute
    compile $ do
        posts <- recentFirst =<< loadAll "posts/*"
        let indexCtx =
                listField "posts" postCtx (return posts) `mappend`
                constField "title" "Home"                `mappend`
                siteCtx -- INCLUDE THE CUSTOM FUNCTION, it sends variable/values to the template in the lines below

        getResourceBody
            >>= applyAsTemplate indexCtx
            >>= loadAndApplyTemplate "templates/default.html" indexCtx
            >>= relativizeUrls
```

---

## Usage

### **Posts**

At the top of each blog post saved in the `posts` folder: 

```markdown
---
title: Carpe Diem
headerImg: file.jpg
---
```

You have the option of adding your custom fields. For example here headerImg is defined for custom files but you can choose to have the same image on all blog posts.

### **Pagination**

The template post.html comes with tags for *next post* and *previous post*.

```html
<ul class="pager">
    $if(previous.url)$
    <li class="previous">
	<a href="{{ page.previous.url | prepend: site.baseurl | replace: '//', '/' }}" 
	   title="{{page.previous.title}}">&larr; Previous Post</a>
    </li>
    $endif$
    $if(next.url)$
    <li class="next">
	<a href="{{ page.next.url | prepend: site.baseurl | replace: '//', '/' }}"
           title="{{page.next.title}}">Next Post &rarr;</a>
    </li>
    $endif$
</ul>
```
See [this blog post]() for an example of how to turn on these links.



### **Syntax Highlighting**

Syntax highlighting uses the pandoc formatting.

    ```hs
	fs x = "your code here"
    ```

The colors are defined in syntax.css; which you can edit to your liking.


