index =
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @vacation_block = $(".vacation_block")
    @year_select    = $(".year-select")
    
  bindEvents: ->
    do @initYearSelector
  
  initYearSelector: ->
    @year_select.change (ev) =>
      element = $(ev.currentTarget)
      me = @
      $.ajax
        url: SYS.baseUrl + 'admin/vacation/get_vacation'
        data: $.param({year : element.find(":selected").val()})
        type: 'POST'
        dataType: 'json'
        success: (res) =>
          if res.text = "success"
            me.vacation_block.html res.data
      false

$(document).ready ->
  do index.init