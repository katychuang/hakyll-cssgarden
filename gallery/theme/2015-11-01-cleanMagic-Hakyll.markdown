---
title: cleanMagic-hakyll
tags: fixed-width
author: katychuang
authorurl: http://twitter.com/katychuang
cover: cleanMagic_hakyll-index.png
screens: cleanMagic_hakyll-index, cleanMagic_hakyll-about, cleanMagic_hakyll-archive, cleanMagic_hakyll-contact, cleanMagic_hakyll-index
demo: http://ismailmustafa.com
download: https://github.com/katychuang/hakyll-cssgarden/blob/master/cleanMagic-hakyll
---

# CleanMagic for Hakyll

This theme is a fork of [CleanMagicMedium-Jekyll](https://github.com/SpaceG/CleanMagicMedium-Jekyll) originally published by Lucas Gatsas.

It features a top navigation bar, and an area for beautiful header background images. Clean and serene, it's sure to give your posts an extra polish.

![Preview](https://raw.githubusercontent.com/SpaceG/spaceg.github.io/5f240c5e8b3f8e2cb9f776688466de651d5d8958/img/intro-theme-1.png)

Features a nice big header image to sweeten your page.

---

## Installation:

Download the files under the `cleanMagic-hakyll` folder in the hakyll-cssgarden repo to your root hakyll installation for the boilerplate. Feel free to tweak site.hs and any of the files.

Compile the site generator with hakyll using the command `ghc --make site.hs`

Then you can view your site locally with `./site rebuild && ./site watch`

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


