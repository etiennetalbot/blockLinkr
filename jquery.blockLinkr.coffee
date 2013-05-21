# blockLinkr jQuery Plugin
# A plugin for turning blocks of content into clickable links
# version 1.0, May 19th, 2013
# by Etienne Talbot

jQuery.blockLinkr = (element, settings) ->
  
  # default config values
  config =
    linkTarget:    ''   # (OPTIONAL) Selector to the <a> tag that points to the desired url (if not set, the first encountered in the blockLinkr element will be used)
    pointerCursor: true # By default adds "cursor: pointer" to the CSS styling of the element if the cursor isn't already styled (different than "auto")
  
  jQuery.extend config, settings if settings
  
  element =           jQuery element
  targetURL =         ''              #The URL to point to
  targetWindow =      ''              #The link needs to open in which window
  doubleLinkingFlag = false           #Flag to determine if a link was clicked
  
  # initialize the plugin
  init = ->
    element.find('a').on 'mouseup', preventDoubleLinking
    elementStyling()
    getHrefTarget()
    
    return
  
  # Prevent the link to open twice if clicked directly on (possible on target blanks)
  preventDoubleLinking = ->
    doubleLinkingFlag = true

    return

  # Add a pointing hand style to the cursor hovering the element
  elementStyling = ->
    if element.css('cursor') is 'auto' and config.pointerCursor is true
      element.css 'cursor', 'pointer'

    return
  
  # Determine the link's href and target
  getHrefTarget = ->
    if config.linkTarget isnt ''
      customLinkTarget = element.find config.linkTarget
    else
      customLinkTarget = []

    if customLinkTarget.length > 0
      targetURL =    customLinkTarget.attr 'href'
      targetWindow = customLinkTarget.attr 'target'
    else
      containedLinks = element.find 'a'
      if containedLinks.length > 0
        firstLink =    containedLinks.eq 0
        targetURL =    firstLink.attr 'href'
        targetWindow = firstLink.attr 'target'
    
    element.on('mouseup', setLink) if targetURL?
    
    return
  
  # If not already clicked, go to destination
  setLink = ->
    if not doubleLinkingFlag
      if targetWindow is null or targetWindow is '' or targetWindow is undefined
        window.location = targetURL
      else
        window.open targetURL, targetWindow
    else
      doubleLinkingFlag = false

    return
  

  init()
  
  return this

jQuery.fn.blockLinkr = (options) ->
  @each( ->
    if jQuery(this).data('blockLinkr') is undefined
      plugin = new jQuery.blockLinkr this, options
      jQuery(this).data 'blockLinkr', plugin
    return
  )