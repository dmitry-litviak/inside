index =
  template : JST["notices/notice"]
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @form               = $("#notice_form")
    @text               = $("#text_notice")
    @select_box         = $("#type")
    @active_notices     = $(".active_notices")
    @nonactive_notices  = $(".nonactive_notices")
    
  bindEvents: ->
    do @initForm
    do @initValidate
    
  destroyer: (el) ->
    @deleteNotice($(el).parent().attr("id"))
    $(el).parent().remove()
    
  initValidate: ->
    @form.validate
      rules:
        "text":
          minlength: 2
          required: true
  
  activator: (el) ->
    button = $(el)
    parent = button.parent()
    if button.hasClass "deactivate"
      button.html "make active"
      button.removeClass("deactivate").addClass "activate"
      @nonactive_notices.append parent.addClass("nonactive_notice")
      @setStatus(0 ,parent.attr("id"))
    else
      button.html "make non-active"
      button.removeClass("activate").addClass "deactivate"
      @active_notices.append parent.removeClass("nonactive_notice")
      @setStatus(1 ,parent.attr("id"))
  
  setStatus: (status, id) ->
    $.ajax
      url: SYS.baseUrl + 'admin/notices/change_status'
      data: $.param({status : status, id : id})
      type: 'POST'
      dataType: 'json'
      success: (res) =>
        console.log res
    false
    
  deleteNotice: (id) ->
    $.ajax
      url: SYS.baseUrl + 'admin/notices/delete'
      data: $.param({id : id})
      type: 'POST'
      dataType: 'json'
      success: (res) =>
        console.log res
    false
  
  initForm: ->
    @form.submit =>
      if @form.valid()
        $.ajax
          url: SYS.baseUrl + 'admin/notices/add'
          data: $.param({type : @select_box.find(':selected').attr('value'), text: @text.attr('value')})
          type: 'POST'
          dataType: 'json'
          success: (res) =>
            console.log res
            @appendElement(res)
      false
      
  appendElement: (res) ->
    @active_notices.append @template({type : res.data.type , text : res.data.text, id : res.data.id, status_title : @getStatusTitle(res.data.type)})
  
  getStatusTitle: (status) ->
    result = 'Good news!'
    switch status
      when 'success'
        result = 'Good news!'
      when 'error'
        result = 'Oh snap!'
      when 'info'
        result = 'Heads up'
      else
        result = 'Holy guacamole!'
    result
  
$(document).ready ->
  do index.init