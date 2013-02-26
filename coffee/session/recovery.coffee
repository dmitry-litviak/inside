recovery =
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @form  = $("#recovery")
    
  bindEvents: ->
    do @initValidate
  
  initValidate: ->
    @form.validate
      rules:
        "new":
          minlength: 6
          required: true
          
        "new_confirm":
          equalTo: 'input[name="new"]',
          minlength: 6
      

$(document).ready ->
  do recovery.init