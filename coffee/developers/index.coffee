index =
  template : JST["developers/index"]
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->
    @filter_container = $("div.filter")
    @section = $("#developers")
    @filter =
      dev : @filter_container.find("ul.dev > li")
      pr   : @filter_container.find("ul.pr > li")

    @active =
      dev  : 'all_dev'
      pr   : 'all_pr'

  bindEvents: ->
    do @initBinder
    do @renderDevs
  
  initBinder: ->
    @filter.dev.click (ev) =>
      loadingMask.show()
      @filter.dev.removeClass("active")
      element = $(ev.currentTarget)
      element.addClass("active")
      @active.dev = element.data("id")
      do @renderDevs
      
    @filter.pr.click (ev) =>
      loadingMask.show()
      @filter.pr.removeClass("active")
      element = $(ev.currentTarget)
      element.addClass("active")
      @active.pr = element.data("id")
      do @renderDevs
    
  renderDevs: () ->
    $.ajax
      url: SYS.baseUrl + 'developers/get_developers'
      data: $.param({filter_dev : @active.dev, filter_pr : @active.pr })
      type: 'POST'
      dataType: 'json'
      success: (res) =>
        if res.text = "success"
          @section.empty()
          @section.append @template({developers : res.data, active : @active.dev})
          loadingMask.hide()
    false

$(document).ready ->
  do index.init