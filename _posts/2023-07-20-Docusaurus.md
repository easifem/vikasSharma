---
title: "Handling images in dark and light mode of docusaurus"
tags: [Docusaurus, markdown]
style: border
color: primary
description: This post shows the procedure of handling images in dark and light mode of docusaurus.
---

This post shows how to maintain consistant images in dark and light mode of website.

First we need to add following lines to `custom.css`.

```css
[data-theme="light"] img[src$="#gh-dark-mode-only"],
[data-theme="dark"] img[src$="#gh-light-mode-only"] {
  display: none;
}
```

Now we need to create two images, `image-dark` for dark mode, and `image-light` for light mode. Then, we can use the following way to import the image.

```md
![dark-image](/img/image-dark.svg#gh-dark-mode-only)
![light-image](/img/image-light.svg#gh-light-mode-only)
```

In summary, we need to create image for each mode, then we just append `#gh-dark-mode-only` and `#gh-light-mode-only` for dark and light mode, respectively.
