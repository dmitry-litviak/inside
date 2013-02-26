vacation =
  vacation_templ : JST["emploees/vacation"]
  day_option     : JST["emploees/day_option"]
  modal_template : JST["emploees/modal_vacation"]

  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->
    @year_select  = $(".year-select")
    @div_model    = $("#modal_delete")
    @div_vacation = $(".vacation")
    do @recallVacationElements
    
  bindEvents: ->
    do @initVacationAdder
    do @initVacationDeleter
    do @initMonthSelect
    do @initYearSelector
    do @initDaySelect
    
  initYearSelector: ->
    @year_select.change (ev) =>
      element = $(ev.currentTarget)
      me = @
      $.ajax
        url: SYS.baseUrl + 'admin/employees/get_year_vacations'
        data: $.param({year : element.find(":selected").val(), user_id : element.data("id")})
        type: 'POST'
        dataType: 'json'
        success: (res) =>
          if res.text = "success"
            me.div_vacation.html res.data
      false
  
  initMonthSelect: ->
    @month_select = $(".month-select")
    @month_select.unbind('change')
    @month_select.change (ev) =>
      element = $(ev.currentTarget)
      me = @
      me.validateDates element, true
      me.getDaysInMonth element
      if element.hasClass("begin")
        me.getDaysInMonth element.next().next() 
      else 
        me.getDaysInMonth element.prev().prev() 
      false
  
  getDaysInMonth: (element) ->
    $.ajax
      url: SYS.baseUrl + 'admin/employees/get_months_list'
      data: $.param({month : element.val()})
      type: 'POST'
      dataType: 'json'
      success: (res) =>
        if res.text = "success"
          element.prev().html vacation.day_option({days : res.data.days})
  
  initDaySelect: ->
    @day_select = $(".day-select")
    @day_select.unbind('change')
    @day_select.change (ev) =>
      element = $(ev.currentTarget)
      me = @
      me.validateDates element, false       
      false
  
  validateDates: (element, month_flag) ->
    begin_value = if element.hasClass("begin") then element.val() else element.prev().prev().val()
    end_value   = if element.hasClass("end") then element.val() else element.next().next().val()
    if ((end_value - begin_value) <= -1) or end_value is begin_value
      unless end_value is begin_value and month_flag
        if element.hasClass("begin")
          element.next().next().val parseInt(begin_value) + 1
        else
          element.prev().prev().val parseInt(end_value) - 1 
        
  recallVacationElements: ->
    @v_add    = $("#vacation-button")
    @v_field  = $(".vacation-field")
    @v_remove = $(".vacation-remove")
  
  initVacationAdder: () ->
    @v_add.click (e) =>
      @v_field.append @vacation_templ({})
      do @recallVacationElements
      do @initVacationDeleter
      do @initMonthSelect
      do @initDaySelect
      
  _initDeleterSubmit: (element) ->
    $(".btn.btn-primary.delete").click (e) =>
      el = $(e.currentTarget)
      $.ajax
        url: SYS.baseUrl + 'admin/employees/delete_vacation'
        data: $.param({id : el.data("id")})
        type: 'POST'
        dataType: 'json'
        success: (res) =>
          if res.text = "success"
            $("#myModal").modal('hide')
            element.parent().remove()
      false
  
  initVacationDeleter: () ->
    @v_remove.unbind('click')
    @v_remove.click (e) =>
      el = $(e.currentTarget)
      @div_model.html @modal_template({id : el.data("id")})
      @_initDeleterSubmit el
      $("#myModal").modal('show')
      
      
      

$(document).ready ->
  do vacation.init
    
        
