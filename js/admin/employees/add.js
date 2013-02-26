var add;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
add = {
  alert_template: JST["emploees/alert"],
  reset_template: JST["emploees/reset"],
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    this.jcrop_api = void 0;
    this.boundx = void 0;
    this.boundy = void 0;
    this.form = $(".user-edit");
    this.input_avatar = $("#input-avatar");
    this.avatar_img = $(".full-avatar img");
    this.crop_avatar = $("#crop-avatar");
    this.senior_exams = $('.senior_exams');
    this.middle_exams = $('.middle_exams');
    this.fileupload = $("#fileupload");
    this.level = $("#level");
    this.enlevel = $("#enlevel");
    this.add_new = $("#add_new");
    this.reset_btn = $(".reset");
    this.div_alert = $("#alert_div");
    this.span_company = $("#next_exam_company");
    this.span_english = $("#next_exam_english");
    this.exams_block = $("#next_exams");
    this.next_exam_en = $("#next_exam_en");
    return this.next_exam_co = $("#next_exam_co");
  },
  bindEvents: function() {
    this.initValidate();
    this.initUploader();
    this.initDatePicker();
    this.initLevelChanger();
    this.initEnlevelChanger();
    this.initAdder();
    this.intiRemover();
    this.resetTests();
    return this.initSubmiter();
  },
  initDatePicker: function() {
    var picker;
    picker = $('.date').datepicker();
    return picker.on('changeDate', function(ev) {
      return console.log(ev);
    });
  },
  initSubmiter: function() {
    return this.form.submit(__bind(function() {
      if (this.form.valid()) {
        loadingMask.show();
      }
      return true;
    }, this));
  },
  updateAvatar: function(data) {
    this.avatar_img.attr('src', SYS.baseUrl + data);
    if ($('#preview').length > 0) {
      $('#preview').remove();
    }
    $('<div id="preview" style="width:100px;height:100px;overflow:hidden;"><img style="max-width: none" src="' + SYS.baseUrl + data + '" /><div>').insertAfter($(".left"));
    return this.input_avatar.val(data);
  },
  initValidate: function() {
    var flag;
    if (document.URL.indexOf("edit") !== -1) {
      flag = false;
    } else {
      flag = true;
    }
    $.validator.addMethod("checkUsername", (function(value) {
      return eval($.ajax({
        url: SYS.baseUrl + "admin/employees/ajax_check_username",
        data: jQuery.param({
          "username": value
        }),
        async: false,
        type: "post"
      }).responseText);
    }), "Username already exists!");
    $.validator.addMethod("checkEmail", (function(value) {
      return eval($.ajax({
        url: SYS.baseUrl + "admin/employees/ajax_check_email",
        data: jQuery.param({
          "email": value
        }),
        async: false,
        type: "post"
      }).responseText);
    }), "Email already exists!");
    return this.form.validate({
      rules: {
        "user[username]": {
          minlength: 2,
          checkUsername: flag,
          required: true
        },
        'user[password]': {
          minlength: 6,
          required: flag
        },
        'user[first_name]': {
          minlength: 2,
          required: true
        },
        'user[last_name]': {
          minlength: 2,
          required: true
        },
        'user[email]': {
          minlength: 5,
          checkEmail: flag,
          email: true,
          required: true
        },
        'user[devrole]': {
          minlength: 2,
          required: true
        }
      },
      highlight: function(label) {},
      success: function(label) {}
    });
  },
  initAreaSelect: function() {
    var me;
    me = this;
    return this.avatar_img.Jcrop({
      onChange: me.updatePreview,
      onSelect: me.updatePreview,
      aspectRatio: 1
    }, function() {
      var bounds;
      bounds = this.getBounds();
      me.boundx = bounds[0];
      me.boundy = bounds[1];
      add.jcrop_api = this;
      return add.jcrop_api.setSelect([0, 0, me.boundx, me.boundy]);
    });
  },
  updatePreview: function(c) {
    var obj, rx, ry;
    obj = {
      x: (c.x / (add.avatar_img.width() / 100)) * add.avatar_img[0].naturalWidth / 100,
      y: (c.y / (add.avatar_img.height() / 100)) * add.avatar_img[0].naturalHeight / 100,
      width: (c.w / (add.avatar_img.width() / 100)) * add.avatar_img[0].naturalWidth / 100,
      height: (c.h / (add.avatar_img.height() / 100)) * add.avatar_img[0].naturalHeight / 100
    };
    add.crop_avatar.val(JSON.stringify(obj));
    if (parseInt(c.w) > 0) {
      rx = 100 / c.w;
      ry = 100 / c.h;
      return $("#preview img").css({
        width: Math.round(rx * add.boundx) + "px",
        height: Math.round(ry * add.boundy) + "px",
        marginLeft: "-" + Math.round(rx * c.x) + "px",
        marginTop: "-" + Math.round(ry * c.y) + "px"
      });
    }
  },
  deleteCertificate: function(id, el, user_id) {
    $.ajax({
      url: SYS.baseUrl + 'admin/employees/delete_certificate',
      data: $.param({
        id: id,
        user_id: user_id
      }),
      type: 'POST',
      dataType: 'json',
      success: __bind(function(res) {
        if (res.text = "success") {
          return $(el).parent().remove();
        }
      }, this)
    });
    return false;
  },
  initAdder: function() {
    return this.add_new.click(function() {
      return $(JST['emploees/test']()).insertBefore($(this));
    });
  },
  intiRemover: function() {
    return $(document).on("click", ".btn.remove", function() {
      return $(this).parent().remove();
    });
  },
  initLevelChanger: function() {
    this.level.change(__bind(function(e) {
      var el, selectedValue;
      el = $(e.currentTarget);
      selectedValue = el.find(":selected").val();
      switch (selectedValue) {
        case '1':
          this.exams_block.show();
          this.next_exam_co.show();
          this.senior_exams.hide();
          return this.middle_exams.show();
        case '2':
          this.exams_block.show();
          this.next_exam_co.show();
          this.senior_exams.show();
          return this.middle_exams.hide();
        default:
          this.next_exam_co.hide();
          return this.exams_block.hide();
      }
    }, this));
    return this.level.trigger('change');
  },
  initEnlevelChanger: function() {
    this.enlevel.change(__bind(function(e) {
      var el, selectedValue;
      el = $(e.currentTarget);
      selectedValue = el.find(":selected").val();
      switch (selectedValue) {
        case '5':
          return this.next_exam_en.hide();
        default:
          return this.next_exam_en.show();
      }
    }, this));
    return this.enlevel.trigger('change');
  },
  resetTests: function() {
    return this.reset_btn.click(__bind(function(ev) {
      var element, me, type;
      me = this;
      element = $(ev.currentTarget);
      if (element.hasClass("com")) {
        type = "company";
      } else {
        type = "english";
      }
      $.ajax({
        url: SYS.baseUrl + 'admin/employees/update_passing',
        data: $.param({
          user_id: element.data("id"),
          type: type
        }),
        type: 'POST',
        dataType: 'json',
        success: __bind(function(res) {
          if (res.text = "success") {
            if (type === "company") {
              return me.span_company.html(me.reset_template({
                type: "important",
                days: res.data + " days to pass"
              }));
            } else {
              return me.span_english.html(me.reset_template({
                type: "important",
                days: res.data + " days to pass"
              }));
            }
          }
        }, this)
      });
      return false;
    }, this));
  },
  initUploader: function() {
    var me;
    me = this;
    return this.fileupload.fileupload({
      acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
      dataType: "json",
      fail: function(e, data) {
        return add.div_alert.html(add.alert_template({
          type: "error",
          message: "Invalid file type. Please use jpg, gif or png.",
          strong: "Error!"
        }));
      },
      add: function(e, data) {
        loadingMask.show();
        return data.submit();
      },
      done: function(e, data) {
        loadingMask.hide();
        if (data.result.text === 'success') {
          add.div_alert.html("");
          if (me.jcrop_api != null) {
            me.jcrop_api.destroy();
          }
          me.updateAvatar(data.result.data);
          me.input_avatar.attr('data-action', 'update');
          return me.initAreaSelect();
        } else {
          return edit.div_alert.html(edit.alert_template({
            type: "error",
            message: "Invalid file type. Please use jpg, gif or png.",
            strong: "Error!"
          }));
        }
      }
    });
  }
};
$(document).ready(function() {
  return add.init();
});