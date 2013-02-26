loadingMask =
  delay: 100
  spinner : {}
  opts :
    color   : '#f7f2f7'
    shape   : 'spiral'
    diameter: 103
    density : 52
    range   : 1.4
    FPS     : 30
  
  createSpinner: () ->
    if _.isEmpty(@spinner)
      @spinner = new CanvasLoader("spinner")
      @spinner.setShape(@opts.shape) 
      @spinner.setColor(@opts.color)
      @spinner.setDiameter(@opts.diameter); 
      @spinner.setDensity(@opts.density); 
      @spinner.setRange(@opts.range); 
      @spinner.setFPS(@opts.FPS); 

      loaderObj = document.getElementById("canvasLoader")
      loaderObj.style.position = "absolute"
      loaderObj.style["top"] = @spinner.getDiameter() * -0.5 + "px"
      loaderObj.style["left"] = @spinner.getDiameter() * -0.5 + "px"

  show: (spinner = true) ->
    @createSpinner()
    $.blockUI({ message: null })
    @spinner.show() if spinner

  hide: ->
    @spinner.hide()
    $.unblockUI()