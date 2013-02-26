var loadingMask;
loadingMask = {
  delay: 100,
  spinner: {},
  opts: {
    color: '#f7f2f7',
    shape: 'spiral',
    diameter: 103,
    density: 52,
    range: 1.4,
    FPS: 30
  },
  createSpinner: function() {
    var loaderObj;
    if (_.isEmpty(this.spinner)) {
      this.spinner = new CanvasLoader("spinner");
      this.spinner.setShape(this.opts.shape);
      this.spinner.setColor(this.opts.color);
      this.spinner.setDiameter(this.opts.diameter);
      this.spinner.setDensity(this.opts.density);
      this.spinner.setRange(this.opts.range);
      this.spinner.setFPS(this.opts.FPS);
      loaderObj = document.getElementById("canvasLoader");
      loaderObj.style.position = "absolute";
      loaderObj.style["top"] = this.spinner.getDiameter() * -0.5 + "px";
      return loaderObj.style["left"] = this.spinner.getDiameter() * -0.5 + "px";
    }
  },
  show: function(spinner) {
    if (spinner == null) {
      spinner = true;
    }
    this.createSpinner();
    $.blockUI({
      message: null
    });
    if (spinner) {
      return this.spinner.show();
    }
  },
  hide: function() {
    this.spinner.hide();
    return $.unblockUI();
  }
};