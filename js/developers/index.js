var index;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
index = {
  template: JST["developers/index"],
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    this.filter_container = $("div.filter");
    this.section = $("#developers");
    this.filter = {
      dev: this.filter_container.find("ul.dev > li"),
      pr: this.filter_container.find("ul.pr > li")
    };
    return this.active = {
      dev: 'all_dev',
      pr: 'all_pr'
    };
  },
  bindEvents: function() {
    this.initBinder();
    return this.renderDevs();
  },
  initBinder: function() {
    this.filter.dev.click(__bind(function(ev) {
      var element;
      loadingMask.show();
      this.filter.dev.removeClass("active");
      element = $(ev.currentTarget);
      element.addClass("active");
      this.active.dev = element.data("id");
      return this.renderDevs();
    }, this));
    return this.filter.pr.click(__bind(function(ev) {
      var element;
      loadingMask.show();
      this.filter.pr.removeClass("active");
      element = $(ev.currentTarget);
      element.addClass("active");
      this.active.pr = element.data("id");
      return this.renderDevs();
    }, this));
  },
  renderDevs: function() {
    $.ajax({
      url: SYS.baseUrl + 'developers/get_developers',
      data: $.param({
        filter_dev: this.active.dev,
        filter_pr: this.active.pr
      }),
      type: 'POST',
      dataType: 'json',
      success: __bind(function(res) {
        if (res.text = "success") {
          this.section.empty();
          this.section.append(this.template({
            developers: res.data,
            active: this.active.dev
          }));
          return loadingMask.hide();
        }
      }, this)
    });
    return false;
  }
};
$(document).ready(function() {
  return index.init();
});