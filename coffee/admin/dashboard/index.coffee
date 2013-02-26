index =
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @remove_buttons = $(".remove")
  
  bindEvents: ->
    do @initRemover
  
  initRemover: ->
    @remove_buttons.click (el) =>
      element = $(el.currentTarget)
      @deleteFeed(element.data("id"))
      $(element.parents().get(1)).remove()
      
  deleteFeed: (id) ->
    $.ajax
      url: SYS.baseUrl + 'admin/dashboard/delete'
      data: $.param({id : id})
      type: 'POST'
      dataType: 'json'
    false

$(document).ready ->
  do index.init