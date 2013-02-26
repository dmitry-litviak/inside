index =
  template : JST["dashboard/index"]
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->
    @filter_container = $("div.filter")
    @table = $(".table.table-bordered.table-striped tbody")
    @filter =
      feed : @filter_container.find("ul.feed > li")
      pr   : @filter_container.find("ul.pr > li")
    
    @active =
      feed : 'all_feed'
      pr   : 'all_pr'

  bindEvents: ->
    do @initBinder
  
  initBinder: ->
    @filter.feed.click (ev) =>
      loadingMask.show()
      @filter.feed.removeClass("active")
      element = $(ev.currentTarget)
      element.addClass("active")
      @active.feed = element.attr("id")
      do @renderFeeds
      
    @filter.pr.click (ev) =>
      loadingMask.show()
      @filter.pr.removeClass("active")
      element = $(ev.currentTarget)
      element.addClass("active")
      @active.pr = element.data("id")
      do @renderFeeds
    
  renderFeeds: () ->
    $.ajax
      url: SYS.baseUrl + 'dashboard/get_feeds'
      data: $.param({filter_feed : @active.feed, filter_pr : @active.pr })
      type: 'POST'
      dataType: 'json'
      success: (res) =>
        if res.text = "success"
          @table.empty()
          _.each res.data, (value, key) =>
              @table.append @template({el : value})
          loadingMask.hide()
    false

$(document).ready ->
  do index.init