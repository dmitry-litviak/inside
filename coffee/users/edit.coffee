edit =
  template       : JST["users/edit"]
  alert_template : JST["emploees/alert"]
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @jcrop_api     = undefined
    @boundx        = undefined
    @boundy        = undefined
    @input_avatar  = $("#input-avatar")
    @avatar_img    = $(".full-avatar img")
    @crop_avatar   = $("#crop-avatar")
    @fileupload    = $("#fileupload")
    @form          = $("#user-edit")
    @photo         = $("#photo")
    @main_photo    = $("div.myinfo img")
    @div_alert     = $("#alert_div")
    @options =
      success    : @showResponse
      beforeSend: () ->
        loadingMask.show()
    
  bindEvents: ->
    do @initUploader
    do @initValidate
    do @initFormSubmit
    
  initFormSubmit: ->
    @form.submit (e) =>
      el = $(e.currentTarget)
      if @form.valid()
        el.ajaxSubmit @options
      false
      
  showResponse: (responseText, statusText, xhr, $form) ->
    loadingMask.hide()
    if responseText.text == "success"
      $.growlUI "Notification", "Successfully updated"
      edit.photo.html(edit.template({data : responseText.data}))
      edit.main_photo.attr('src', responseText.data.avatar)
      console.log responseText.data
      edit.input_avatar.val responseText.data.avatar_hidden
      do edit.detectElements
      do edit.initUploader
    else
      $.growlUI "Notification", responseText.data.errors
  
  
  updateAvatar: ( data ) ->
    @avatar_img.attr 'src', SYS.baseUrl + data
    if $('#preview').length > 0
      $('#preview').remove()
    $('<div id="preview" style="width:100px;height:100px;overflow:hidden;"><img style="max-width: none" src="' + SYS.baseUrl + data + '" /><div>').insertAfter $(".left")
    @input_avatar.val data
  
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
      edit.jcrop_api = @
      edit.jcrop_api.setSelect([ 0, 0, me.boundx, me.boundy]);
  
  initValidate: ->
    @form.validate
      rules:
        "user[first_name]":
          minlength: 2
          required: true

        "user[last_name]":
          minlength: 2
          required: true
          
        "password[old]":
          minlength: 6
          
        "password[new]":
          minlength: 6
          
        "password[new_confirm]":
          equalTo: 'input[name="password[new]"]',
          minlength: 6
  
  updatePreview: (c) ->

    obj = 
      x       : (c.x / (edit.avatar_img.width()/100))  * edit.avatar_img[0].naturalWidth  / 100
      y       : (c.y / (edit.avatar_img.height()/100)) * edit.avatar_img[0].naturalHeight / 100
      width   : (c.w / (edit.avatar_img.width()/100))  * edit.avatar_img[0].naturalWidth  / 100
      height  : (c.h / (edit.avatar_img.height()/100)) * edit.avatar_img[0].naturalHeight / 100
      
    edit.crop_avatar.val JSON.stringify(obj)
    if parseInt(c.w) > 0
      rx = 100 / c.w
      ry = 100 / c.h
      $("#preview img").css
        width: Math.round(rx * edit.boundx) + "px"
        height: Math.round(ry * edit.boundy) + "px"
        marginLeft: "-" + Math.round(rx * c.x) + "px"
        marginTop: "-" + Math.round(ry * c.y) + "px"  
  
  initUploader: ->
    me = @
    @fileupload.fileupload
      acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
      add: (e, data) ->
        loadingMask.show()
        do data.submit
      dataType: "json"
      fail: (e, data) ->
        edit.div_alert.html edit.alert_template({type : "error", message : "Invalid file type. Please use jpg, gif or png.", strong : "Error!"})
        loadingMask.hide()
      done: (e, data) ->
        loadingMask.hide()
        if data.result.text is 'success'
          if edit.jcrop_api?
            edit.jcrop_api.destroy()
          edit.div_alert.html ""
          me.updateAvatar data.result.data
          me.input_avatar.attr 'data-action', 'update'
          do me.initAreaSelect
        else
          edit.div_alert.html edit.alert_template({type : "error", message : "Invalid file type. Please use jpg, gif or png.", strong : "Error!"})
          loadingMask.hide()
     
$(document).ready ->
  do edit.init