var index;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
index = {
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    this.vacation_block = $(".vacation_block");
    return this.year_select = $(".year-select");
  },
  bindEvents: function() {
    return this.initYearSelector();
  },
  initYearSelector: function() {
    return this.year_select.change(__bind(function(ev) {
      var element, me;
      element = $(ev.currentTarget);
      me = this;
      $.ajax({
        url: SYS.baseUrl + 'admin/vacation/get_vacation',
        data: $.param({
          year: element.find(":selected").val()
        }),
        type: 'POST',
        dataType: 'json',
        success: __bind(function(res) {
          if (res.text = "success") {
            return me.vacation_block.html(res.data);
          }
        }, this)
      });
      return false;
    }, this));
  }
};
$(document).ready(function() {
  return index.init();
});