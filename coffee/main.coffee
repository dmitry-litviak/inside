main =
  init: ->
    do @detectElements
    do @bindEvents
    
  detectElements: ->    
    @alerts = $('.alert')
    
  bindEvents: ->
    do @dismissAlert
    
  dismissAlert: ->
    @alerts.bind "closed", (e) ->
      el = $(e.currentTarget)
      $.ajax
        url: SYS.baseUrl + 'users/check_notice'
        data: $.param({type : el.data("type"), id : el.data("id")})
        type: 'POST'
        dataType: 'json'
  #        success: (res) =>
  #          if res.text = "success"
  #            $(el).parent().remove()
      false
#      console.log el.data("type")
#      console.log "alert"
      

$(document).ready ->
  do main.init