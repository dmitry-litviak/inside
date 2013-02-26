var index;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
index = {
  template: JST["notices/notice"],
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    this.form = $("#notice_form");
    this.text = $("#text_notice");
    this.select_box = $("#type");
    this.active_notices = $(".active_notices");
    return this.nonactive_notices = $(".nonactive_notices");
  },
  bindEvents: function() {
    this.initForm();
    return this.initValidate();
  },
  destroyer: function(el) {
    this.deleteNotice($(el).parent().attr("id"));
    return $(el).parent().remove();
  },
  initValidate: function() {
    return this.form.validate({
      rules: {
        "text": {
          minlength: 2,
          required: true
        }
      }
    });
  },
  activator: function(el) {
    var button, parent;
    button = $(el);
    parent = button.parent();
    if (button.hasClass("deactivate")) {
      button.html("make active");
      button.removeClass("deactivate").addClass("activate");
      this.nonactive_notices.append(parent.addClass("nonactive_notice"));
      return this.setStatus(0, parent.attr("id"));
    } else {
      button.html("make non-active");
      button.removeClass("activate").addClass("deactivate");
      this.active_notices.append(parent.removeClass("nonactive_notice"));
      return this.setStatus(1, parent.attr("id"));
    }
  },
  setStatus: function(status, id) {
    $.ajax({
      url: SYS.baseUrl + 'admin/notices/change_status',
      data: $.param({
        status: status,
        id: id
      }),
      type: 'POST',
      dataType: 'json',
      success: __bind(function(res) {
        return console.log(res);
      }, this)
    });
    return false;
  },
  deleteNotice: function(id) {
    $.ajax({
      url: SYS.baseUrl + 'admin/notices/delete',
      data: $.param({
        id: id
      }),
      type: 'POST',
      dataType: 'json',
      success: __bind(function(res) {
        return console.log(res);
      }, this)
    });
    return false;
  },
  initForm: function() {
    return this.form.submit(__bind(function() {
      if (this.form.valid()) {
        $.ajax({
          url: SYS.baseUrl + 'admin/notices/add',
          data: $.param({
            type: this.select_box.find(':selected').attr('value'),
            text: this.text.attr('value')
          }),
          type: 'POST',
          dataType: 'json',
          success: __bind(function(res) {
            console.log(res);
            return this.appendElement(res);
          }, this)
        });
      }
      return false;
    }, this));
  },
  appendElement: function(res) {
    return this.active_notices.append(this.template({
      type: res.data.type,
      text: res.data.text,
      id: res.data.id,
      status_title: this.getStatusTitle(res.data.type)
    }));
  },
  getStatusTitle: function(status) {
    var result;
    result = 'Good news!';
    switch (status) {
      case 'success':
        result = 'Good news!';
        break;
      case 'error':
        result = 'Oh snap!';
        break;
      case 'info':
        result = 'Heads up';
        break;
      default:
        result = 'Holy guacamole!';
    }
    return result;
  }
};
$(document).ready(function() {
  return index.init();
});