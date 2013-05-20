blockLinkr
==========

CoffeeScript plugin to make blocks of content (element) entirely clickable, referring to a link inside of it.

Requirements
------------

This plugin requires jQuery

Information
-----------
- Links inside of the element will still be clickable and will lead to their respective hrefs
- If the a tag refered to has a target attribute, that attribute will be considered when the element is clicked
- If multiple links are found in the element, only the first one will be considered (unless another one is specified in the `linkTarget` parameter)



Parameters
----------

### linkTarget
*(string)* - Selector to the `<a>` tag that points to the desired url (if not set, the first encountered in the blockLinkr element will be used)

### pointerCursor
*(boolean) default: true* - Adds "cursor: pointer" to the CSS styling of the element if the cursor isn't already styled

Usage
-----
### JavaScript
	$('.container').blockLinkr({
	  linkTarget: '.links-class',
	  pointerCursor: true
	});

### CoffeeScript
	$('.container').blockLinkr
	  linkTarget: '.link-class'
	  pointerCursor: true