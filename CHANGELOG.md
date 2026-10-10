# Changelog

## 1.0.10

* Bump jqnext to 1.0.19 - fixes admin accordions (jQuery UI accordion, e.g. the form builder's field picker) not opening or closing. `animate()` now supports jQuery's `"show"`, `"hide"` and `"toggle"` property values, which jQuery UI uses to animate panels open and shut.

## 1.0.9

* Bump jqnext to 1.0.18 - fixes the Preside data grid (DataTables 3) failing to initialise with "Cannot read properties of undefined (reading 'className')". jQuery pseudos part-way through a selector (`thead > tr:first > th`) now apply where they sit rather than to the final result, and `trigger( $.Event( ... ), args )` keeps its extra arguments, namespace and event properties as the event bubbles.

## 1.0.8

* Bump jqnext to 1.0.17 - adds jQuery's plain-object event bus (`$(obj).on()` / `$(obj).triggerHandler()`), which FullCalendar 3.x builds its internal EmitterMixin on. Without it the calendar-view extension rendered its toolbar and nothing else - no day grid, no title, no events, and no console error.

## 1.0.7

* Bump jqnext to 1.0.16 - fixes `$.fn.load()` shadowing the `load` event shorthand, which stopped `jquery.lazy` initialising (lazy-loaded images, such as the asset manager preview, stayed on their loading placeholder).

## 1.0.6

* Bump sandal to 1.4.1 - fixes collapsibles (e.g. the admin mobile/burger nav) animating open and then instantly hiding again. Sandal now leaves an inline `height: auto` on a shown collapsible, matching Bootstrap 3.
