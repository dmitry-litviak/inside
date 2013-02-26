forgot =
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @form  = $("#forgot")
    
  bindEvents: ->
    do @initValidate
  
  initValidate: ->
    @form.validate
      rules:
        "email":
          minlength: 6
          email:true
          required: true
      

$(document).ready ->
  do forgot.init