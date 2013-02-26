add =
  alert_template : JST["emploees/alert"]
  reset_template : JST["emploees/reset"]

  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @jcrop_api     = undefined
    @boundx        = undefined
    @boundy        = undefined
    @form          = $(".user-edit")
    @input_avatar  = $("#input-avatar")
    @avatar_img    = $(".full-avatar img")
    @crop_avatar   = $("#crop-avatar")
    @senior_exams  = $('.senior_exams')
    @middle_exams  = $('.middle_exams')
    @fileupload    = $("#fileupload")
    @level         = $("#level")
    @enlevel       = $("#enlevel")
    @add_new       = $("#add_new")
    @reset_btn     = $(".reset")
    @div_alert     = $("#alert_div")
    @span_company  = $("#next_exam_company")
    @span_english  = $("#next_exam_english")
    @exams_block   = $("#next_exams")
    @next_exam_en  = $("#next_exam_en")
    @next_exam_co  = $("#next_exam_co")
    
  bindEvents: ->
    do @initValidate
    do @initUploader
    do @initDatePicker
    do @initLevelChanger
    do @initEnlevelChanger
    do @initAdder
    do @intiRemover
    do @resetTests
    do @initSubmiter
      
  initDatePicker: () ->
    picker = $('.date').datepicker()
    picker.on 'changeDate', (ev) ->
      console.log ev
  
  initSubmiter: () ->
    @form.submit =>
      if @form.valid()
        loadingMask.show()
      true

  updateAvatar: (data) ->
    @avatar_img.attr 'src', SYS.baseUrl + data
    if $('#preview').length > 0
      $('#preview').remove()
    $('<div id="preview" style="width:100px;height:100px;overflow:hidden;"><img style="max-width: none" src="' + SYS.baseUrl + data + '" /><div>').insertAfter $(".left")
    @input_avatar.val data
    
  initValidate: ->
    if document.URL.indexOf("edit") isnt -1
      flag = false
    else 
      flag = true
      
    $.validator.addMethod "checkUsername", ((value) ->
      eval $.ajax(
        url: SYS.baseUrl + "admin/employees/ajax_check_username"
        data: jQuery.param("username": value)
        async: false
        type: "post"
      ).responseText
    ), "Username already exists!"
    
    $.validator.addMethod "checkEmail", ((value) ->
      eval $.ajax(
        url: SYS.baseUrl + "admin/employees/ajax_check_email"
        data: jQuery.param("email": value)
        async: false
        type: "post"
      ).responseText
    ), "Email already exists!"
    
    @form.validate
      rules:
        "user[username]":
          minlength: 2
          checkUsername : flag
          required: true

        'user[password]':
          minlength: 6
          required : flag

        'user[first_name]':
          minlength: 2
          required: true

        'user[last_name]':
          minlength: 2
          required: true

        'user[email]':
          minlength: 5
          checkEmail: flag
          email: true
          required: true
          
        'user[devrole]':
          minlength: 2
          required: true

      highlight: (label) ->
#        $(label).closest("tr").addClass "error"

      success: (label) ->
#        label.text("OK!").addClass("valid").closest("tr").addClass "success"  
  
  initAreaSelect: () ->
    me = @
    @avatar_img.Jcrop
      onChange: me.updatePreview
      onSelect: me.updatePreview
      aspectRatio: 1
    , ->
      bounds = @getBounds()
      me.boundx = bounds[0]
      me.boundy = bounds[1]
      add.jcrop_api = @
      add.jcrop_api.setSelect([ 0, 0, me.boundx, me.boundy]);
  
  updatePreview: (c) ->

    obj = 
      x       : (c.x / (add.avatar_img.width()/100))  * add.avatar_img[0].naturalWidth  / 100
      y       : (c.y / (add.avatar_img.height()/100)) * add.avatar_img[0].naturalHeight / 100
      width   : (c.w / (add.avatar_img.width()/100))  * add.avatar_img[0].naturalWidth  / 100
      height  : (c.h / (add.avatar_img.height()/100)) * add.avatar_img[0].naturalHeight / 100
      
    add.crop_avatar.val JSON.stringify(obj)
    if parseInt(c.w) > 0
      rx = 100 / c.w
      ry = 100 / c.h
      $("#preview img").css
        width: Math.round(rx * add.boundx) + "px"
        height: Math.round(ry * add.boundy) + "px"
        marginLeft: "-" + Math.round(rx * c.x) + "px"
        marginTop: "-" + Math.round(ry * c.y) + "px"  
    
  deleteCertificate: (id, el, user_id) ->
    $.ajax
      url: SYS.baseUrl + 'admin/employees/delete_certificate'
      data: $.param({id : id, user_id : user_id})
      type: 'POST'
      dataType: 'json'
      success: (res) =>
        if res.text = "success"
          $(el).parent().remove()
    false
  
  initAdder: () ->
    @add_new.click ->
      $(JST['emploees/test']()).insertBefore $(@)
  
  intiRemover: () ->
    $(document).on "click", ".btn.remove", ->
      $(@).parent().remove()
  
  initLevelChanger: () ->
    @level.change (e) =>
      el = $(e.currentTarget)
      selectedValue = el.find(":selected").val()
      switch selectedValue
        when '1'
          @exams_block.show()
          @next_exam_co.show()
          @senior_exams.hide()
          @middle_exams.show()
        when '2'
          @exams_block.show()
          @next_exam_co.show()
          @senior_exams.show()
          @middle_exams.hide()
        else
          @next_exam_co.hide()
          @exams_block.hide()
    @level.trigger 'change'
    
  initEnlevelChanger: () ->
    @enlevel.change (e) =>
      el = $(e.currentTarget)
      selectedValue = el.find(":selected").val()
      switch selectedValue
        when '5'
          @next_exam_en.hide()
        else
          @next_exam_en.show()
    @enlevel.trigger 'change'
  
  resetTests: ->
    @reset_btn.click (ev) =>
      me = @
      element = $(ev.currentTarget)
      if element.hasClass("com")
        type = "company"
      else 
        type = "english"
      $.ajax
        url: SYS.baseUrl + 'admin/employees/update_passing'
        data: $.param({user_id : element.data("id"), type : type})
        type: 'POST'
        dataType: 'json'
        success: (res) =>
          if res.text = "success"
              if type is "company"
                me.span_company.html me.reset_template({type : "important", days : res.data + " days to pass"})
              else
                me.span_english.html me.reset_template({type : "important", days : res.data + " days to pass"})
      false
  
  initUploader: ->
    me = @
    @fileupload.fileupload
      acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
      dataType: "json"
      fail: (e, data) ->
        add.div_alert.html add.alert_template({type : "error", message : "Invalid file type. Please use jpg, gif or png.", strong : "Error!"})
      add: (e, data) ->
        loadingMask.show()
        do data.submit
      done: (e, data) ->
        loadingMask.hide()
        if data.result.text is 'success'
          add.div_alert.html ""
          if me.jcrop_api?
            me.jcrop_api.destroy()
          me.updateAvatar data.result.data
          me.input_avatar.attr 'data-action', 'update'
          do me.initAreaSelect
        else
          edit.div_alert.html edit.alert_template({type : "error", message : "Invalid file type. Please use jpg, gif or png.", strong : "Error!"})
      

$(document).ready ->
  do add.init
    
        
