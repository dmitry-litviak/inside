index =
  template       : JST["emploees/modal"]
  alert_template : JST["emploees/alert"]
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @table          = $("table")
    @checkboxes     = $(".admin")
    @div_model      = $("#modal_delete")
    @div_alert      = $("#alert_div")
    @status_buttons = $(".status")
       
  _recallElements: ->
    @remove_buttons = $(".icon-remove") 
  
  bindEvents: ->
    do @_recallElements
    do @_initDeleter
    do @_initAdminSetter
    do @_initStatusChanger
#    do @_initDeleterSubmit
   
  _initStatusChanger: ->
    @status_buttons.click (e) =>
      el = $(e.currentTarget)
      $.ajax
        url: SYS.baseUrl + 'admin/employees/change_status'
        data: $.param({user_id : el.data("id")})
        type: 'POST'
        dataType: 'json'
        success: (res) =>
          if res.text = "success"
            if res.data.status is 1
              el.removeClass('icon-hand-up').addClass('icon-hand-down')
              $('tr.employee-enabled').last().after el.parents('tr').removeClass().addClass('employee-enabled')
            else
              el.removeClass('icon-hand-down').addClass('icon-hand-up')
              if $('tr.employee-disabled').last().length is 0
                last_element = $('tr').last()
                if last_element.attr("id") != el.parents('tr').attr("id")
                  last_element.after el.parents('tr').removeClass().addClass('info employee-disabled')
                else
                  el.parents('tr').removeClass().addClass('info employee-disabled')
                console.log $('tr.employee-enabled').last().get(0)
              else
                $('tr.employee-disabled').last().after el.parents('tr').removeClass().addClass('info employee-disabled')
              
      false
   
  _initDeleter: ->
    @remove_buttons.click (e) =>
      el = $(e.currentTarget)
      @div_model.html @template({id : el.data("id"), name : el.data("name")})
      do @_initDeleterSubmit
      $("#myModal").modal('show')
   
   _initDeleterSubmit: ->
    $(".btn.btn-primary.delete").click (e) =>
      el = $(e.currentTarget)
      $.ajax
        url: SYS.baseUrl + 'admin/employees/delete_employee'
        data: $.param({id : el.data("id")})
        type: 'POST'
        dataType: 'json'
        success: (res) =>
          if res.text = "success"
            $("#row" + el.data("id")).remove()
            $('#myModal').modal('hide')
            @div_alert.html @alert_template({type : "success", message : "Successfully deleted", strong : "Success!"})
          else
            @div_alert.html @alert_template({type : "error", message : "Something went wrong", strong : "Error!"})
      false
   
   _initAdminSetter: () ->
    @checkboxes.change (e) =>
      el = $(e.currentTarget)
      unless el.is(":checked")
        @_changeRole 1, el.data('id')
      else 
        @_changeRole 2, el.data('id')
        
  _changeRole: (id, user_id) ->
    $.ajax
      url: SYS.baseUrl + 'admin/employees/change_role'
      data: $.param({id : id, user_id : user_id})
      type: 'POST'
      dataType: 'json'
#        success: (res) =>
#          if res.text = "success"
#            $(el).parent().remove()
    false
      
$(document).ready ->
  do index.init