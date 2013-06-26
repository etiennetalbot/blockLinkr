// Generated by CoffeeScript 1.4.0
(function() {

  jQuery.blockLinkr = function(element, settings) {
    var config, doubleLinkingFlag, elementStyling, getHrefTarget, init, preventDoubleLinking, setLink, targetURL, targetWindow;
    config = {
      linkTarget: '',
      pointerCursor: true
    };
    if (settings) {
      jQuery.extend(config, settings);
    }
    element = jQuery(element);
    targetURL = '';
    targetWindow = '';
    doubleLinkingFlag = false;
    init = function() {
      element.find('a').on('mouseup.blockLinkr', preventDoubleLinking);
      elementStyling();
      getHrefTarget();
    };
    preventDoubleLinking = function() {
      doubleLinkingFlag = true;
    };
    elementStyling = function() {
      if (element.css('cursor') === 'auto' && config.pointerCursor === true) {
        element.css('cursor', 'pointer');
      }
    };
    getHrefTarget = function() {
      var containedLinks, customLinkTarget, firstLink;
      if (config.linkTarget !== '') {
        customLinkTarget = element.find(config.linkTarget);
      } else {
        customLinkTarget = [];
      }
      if (customLinkTarget.length > 0) {
        targetURL = customLinkTarget.attr('href');
        targetWindow = customLinkTarget.attr('target');
      } else {
        containedLinks = element.find('a');
        if (containedLinks.length > 0) {
          firstLink = containedLinks.eq(0);
          targetURL = firstLink.attr('href');
          targetWindow = firstLink.attr('target');
        }
      }
      if (targetURL != null) {
        element.on('mouseup', setLink);
      }
    };
    setLink = function() {
      if (!doubleLinkingFlag) {
        if (targetWindow === null || targetWindow === '' || targetWindow === void 0) {
          window.location = targetURL;
        } else {
          window.open(targetURL, targetWindow);
        }
      } else {
        doubleLinkingFlag = false;
      }
    };
    init();
    return this;
  };

  jQuery.fn.blockLinkr = function(options) {
    return this.each(function() {
      var plugin;
      if (jQuery(this).data('blockLinkr') === void 0) {
        plugin = new jQuery.blockLinkr(this, options);
        jQuery(this).data('blockLinkr', plugin);
      }
    });
  };

}).call(this);
