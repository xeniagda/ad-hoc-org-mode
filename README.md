## ad-hoc-org-mode

An "implementation" of `org-mode` in kakoune. Editing `.org`-files enables org highlighting and
binds some keys to indentation and dedentation of org-items. Currently implemented features:

* Six levels of highlighting with pretty LGBTQ+-friendly colors
* Use `<`/`>` in normal mode to dedent/indent headings and contents. Is "smart" about whether to add `*`s or spaces to the start of the line
* Use `s-left`/`s-right` in insert mode to indent/dedent.
* Use `ret` and `alt-ret` to insert new indented lines or headings.
