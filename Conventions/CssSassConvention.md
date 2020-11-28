---
sort: 3
---

## CSS Sass convention

### Naming CSS

Naming class css like this : `component__element-part--modifier`

- the component is tracked by 2 `_`
- If you want to work on a part of this element, the part is preceded by 1 `-`
- If you need to modify your part or your element, you use 2 `--` before your modifier
- If the name component has too much parts in its name, you can minify it using the first letters.

  **You can do that only on the component.**

    - example : `form-search-engine__form-group__label--large`
        - the component form-search-engine can be minify to have :

          `fse__form-group__label--large`

  When you do that, you have to put a comment just above your class in the css to explain the minification : `// form-search-engine`

### Comments in Sass

To comment Sass code you can use two methods :

- `/* ... */` : this comment will be see in the compiled CSS
- `//` : this method won't be see in the compiled CSS

**Prefer the second one : //**
