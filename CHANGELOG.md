# Changelog

## 1.0.7

* Bump jqnext to 1.0.16 - fixes `$.fn.load()` shadowing the `load` event shorthand, which stopped `jquery.lazy` initialising (lazy-loaded images, such as the asset manager preview, stayed on their loading placeholder).

## 1.0.6

* Bump sandal to 1.4.1 - fixes collapsibles (e.g. the admin mobile/burger nav) animating open and then instantly hiding again. Sandal now leaves an inline `height: auto` on a shown collapsible, matching Bootstrap 3.
