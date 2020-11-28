---
sort: 1
---

## Mjml

### Documentation

https://mjml.io/documentation/

### Installation

#### installation Mjml

https://mjml.io/documentation/#installation

```
npm install mjml
```

#### Installation nodemon

```
npm install -g nodemon
```

### Start compilation and watch

```
nodemon --ext mjml --exec  mjml  -o nameExportedFile.html nameFileToExport.mjml
```
In your console you can see the compilation message. Look at it because it says you if you did a mistake.
All error are not detected but a lot ! 

### Phpstorm configuration

This configuration allow you to show syntax color for MJML. But they did'nt say you if you're right or not in your code.
- Go to Settings > Editor > File types
- Add a new Recognized file types
- complete
  - Name : MJML
  - Description : MJML files
  - Put in Keyword :
  ```
  mj-accordion
  mj-accordion-element
  mj-accordion-text
  mj-accordion-title
  mj-all
  mj-attributes
  mj-body
  mj-breakpoint
  mj-button
  mj-carousel
  mj-carousel-image
  mj-class
  mj-column
  mj-divider
  mj-font
  mj-group
  mj-head
  mj-hero
  mj-image
  mj-include
  mj-navbar
  mj-navbar-link
  mj-preview
  mj-raw
  mj-section
  mj-social
  mj-social-element
  mj-spacer
  mj-style
  mj-table
  mj-text
  mj-title
  mj-wrapper
  mjml
  td
  tr
  ```
