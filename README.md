# Preside JS Modern

A Preside CMS extension that replaces legacy jQuery and Bootstrap JavaScript with modern, lightweight alternatives while maintaining full API compatibility.

## Overview

Preside's admin interface relies on jQuery 2.x and Bootstrap 3.x. This extension provides drop-in replacements using Preside's Sticker asset management system:

| Legacy Library | Replacement | Description |
|----------------|-------------|-------------|
| jQuery 2.2.5 | **JQNext** | jQuery 2.x API compatible, modern ES6+ internals |
| Bootstrap 3 JS | **SandalJS** | Bootstrap 3 API compatible, powered by JQNext |

## How It Works

Preside uses Sticker for asset management where each asset has a unique ID. This extension registers assets using the **same IDs** as core Preside:

- `/js/admin/lib/jquery/` → JQNext (replaces jQuery)
- `/js/admin/lib/bootstrap/` → SandalJS (replaces Bootstrap JS)

When loaded, Sticker's override mechanism ensures the modern libraries are used throughout the admin interface. All existing Preside JavaScript continues to work without modification.

## Benefits

### Smaller Bundle Size
Both libraries leverage native browser APIs, resulting in significantly smaller file sizes.

### Modern Browser APIs
- **Web Animation API** - Smooth 60fps animations
- **Fetch API** - Modern AJAX with Promises
- **WeakMap** - Memory-efficient data storage
- **Intersection Observer** - Efficient scroll-based features

### Full Compatibility
- jQuery 2.x API - All methods, selectors, and patterns work unchanged
- jQuery UI 1.11.x - Full widget factory support
- Bootstrap 3 components - Modal, Dropdown, Tooltip, Collapse, etc.
- Preside-specific - `window.presideJQuery` automatically set

### Future-Proof
No legacy IE polyfills, ES6+ classes, native Promises, tree-shakeable modules.

## Modern + Legacy: Best of Both Worlds

JQNext enables Preside developers to gradually adopt modern JavaScript patterns while maintaining full compatibility with existing jQuery-based code. This means you can:

**Mix Modern and Legacy Patterns**
```javascript
// Legacy jQuery patterns continue to work
$('.widget').on('click', function() {
    $(this).fadeIn();
});

// Modern patterns work alongside
$('.widget').on('click', async function() {
    const response = await fetch('/api/data');
    const data = await response.json();
    $(this).html(data.content);
});
```

**Use Native Promises with jQuery AJAX**
```javascript
// JQNext's $.ajax() returns a native Promise-compatible object
const data = await $.getJSON('/api/endpoint');

// Or use Fetch directly alongside jQuery DOM manipulation
const response = await fetch('/api/endpoint');
$('.container').html(await response.text());
```

**Leverage Modern APIs in Existing Code**
```javascript
// JQNext uses WeakMap internally, preventing memory leaks in long-running SPAs
$('.dynamic-content').data('instance', complexObject);
// No need to manually clean up - garbage collected automatically

// Animation uses Web Animation API for better performance
$('.element').animate({ opacity: 0.5 }, 300);
// Runs on compositor thread, won't block main thread
```

**Incremental Migration Path**
- Start with this extension as a drop-in replacement
- Write new code using modern JavaScript patterns
- Existing Preside admin customisations continue to work
- Gradually refactor legacy code as time permits

## Installation

```bash
box install preside-ext-jsmodern
```

## Requirements

- Preside CMS 10.x or later
- Modern browsers (Chrome 60+, Firefox 55+, Safari 12+, Edge 79+)

## Included Libraries

### JQNext

Full jQuery 2.x API compatibility:
- Selectors including `:visible`, `:hidden`, `:eq(n)`, etc.
- DOM traversal and manipulation
- Events with delegation and namespacing
- Effects: `fadeIn()`, `slideUp()`, `animate()`, etc.
- AJAX: `$.ajax()`, `$.get()`, `$.post()`
- Utilities: `$.extend()`, `$.Deferred()`, etc.
- jQuery UI widget factory support

### SandalJS

Bootstrap 3 JavaScript components:
- Modal, Dropdown, Tooltip, Popover
- Tab, Collapse, Alert, Button
- Carousel, Scrollspy, Affix
- Full data-attribute API support

## Browser Support

Modern browsers with ES6+ support. Legacy IE is intentionally not supported.

## License

MIT

## Credits

- **JQNext** by Pixl8 Group Limited

https://github.com/pixl8/JQNext

- **SandalJS** by Pixl8 Group Limited

https://github.com/pixl8/SandalJS

- Built for [Preside CMS](https://www.preside.org/)
