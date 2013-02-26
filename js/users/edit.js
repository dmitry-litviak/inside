var edit;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
edit = {
  template: JST["users/edit"],
  alert_template: JST["emploees/alert"],
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    this.jcrop_api = void 0;
    this.boundx = void 0;
    this.boundy = void 0;
    this.input_avatar = $("#input-avatar");
    this.avatar_img = $(".full-avatar img");
    this.crop_avatar = $("#crop-avatar");
    this.fileupload = $("#fileupload");
    this.form = $("#user-edit");
    this.photo = $("#photo");
    this.main_photo = $("div.myinfo img");
    this.div_alert = $("#alert_div");
    return this.options = {
      success: this.showResponse,
      beforeSend: function() {
        return loadingMask.show();
      }
    };
  },
  bindEvents: function() {
    this.initUploader();
    this.initValidate();
    return this.initFormSubmit();
  },
  initFormSubmit: function() {
    return this.form.submit(__bind(function(e) {
      var el;
      el = $(e.currentTarget);
      if (this.form.valid()) {
        el.ajaxSubmit(this.options);
      }
      return false;
    }, this));
  },
  showResponse: function(responseText, statusText, xhr, $form) {
    loadingMask.hide();
    if (responseText.text === "success") {
      $.growlUI("Notification", "Successfully updated");
      edit.photo.html(edit.template({
        data: responseText.data
      }));
      edit.main_photo.attr('src', responseText.data.avatar);
      console.log(responseText.data);
      edit.input_avatar.val(responseText.data.avatar_hidden);
      edit.detectElements();
      return edit.initUploader();
    } else {
      return $.growlUI("Notification", responseText.data.errors);
    }
  },
  updateAvatar: function(data) {
    this.avatar_img.attr('src', SYS.baseUrl + data);
    if ($('#preview').length > 0) {
      $('#preview').remove();
    }
    $('<div id="preview" style="width:100px;height:100px;overflow:hidden;"><img style="max-width: none" src="' + SYS.baseUrl + data + '" /><div>').insertAfter($(".left"));
    return this.input_avatar.val(data);
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
      edit.jcrop_api = this;
      return edit.jcrop_api.setSelect([0, 0, me.boundx, me.boundy]);
    });
  },
  initValidate: function() {
    return this.form.validate({
      rules: {
        "user[first_name]": {
          minlength: 2,
          required: true
        },
        "user[last_name]": {
          minlength: 2,
          required: true
        },
        "password[old]": {
          minlength: 6
        },
        "password[new]": {
          minlength: 6
        },
        "password[new_confirm]": {
          equalTo: 'input[name="password[new]"]',
          minlength: 6
        }
      }
    });
  },
  updatePreview: function(c) {
    var obj, rx, ry;
    obj = {
      x: (c.x / (edit.avatar_img.width() / 100)) * edit.avatar_img[0].naturalWidth / 100,
      y: (c.y / (edit.avatar_img.height() / 100)) * edit.avatar_img[0].naturalHeight / 100,
      width: (c.w / (edit.avatar_img.width() / 100)) * edit.avatar_img[0].naturalWidth / 100,
      height: (c.h / (edit.avatar_img.height() / 100)) * edit.avatar_img[0].naturalHeight / 100
    };
    edit.crop_avatar.val(JSON.stringify(obj));
    if (parseInt(c.w) > 0) {
      rx = 100 / c.w;
      ry = 100 / c.h;
      return $("#preview img").css({
        width: Math.round(rx * edit.boundx) + "px",
        height: Math.round(ry * edit.boundy) + "px",
        marginLeft: "-" + Math.round(rx * c.x) + "px",
        marginTop: "-" + Math.round(ry * c.y) + "px"
      });
    }
  },
  initUploader: function() {
    var me;
    me = this;
    return this.fileupload.fileupload({
      acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
      add: function(e, data) {
        loadingMask.show();
        return data.submit();
      },
      dataType: "json",
      fail: function(e, data) {
        edit.div_alert.html(edit.alert_template({
          type: "error",
          message: "Invalid file type. Please use jpg, gif or png.",
          strong: "Error!"
        }));
        return loadingMask.hide();
      },
      done: function(e, data) {
        loadingMask.hide();
        if (data.result.text === 'success') {
          if (edit.jcrop_api != null) {
            edit.jcrop_api.destroy();
          }
          edit.div_alert.html("");
          me.updateAvatar(data.result.data);
          me.input_avatar.attr('data-action', 'update');
          return me.initAreaSelect();
        } else {
          edit.div_alert.html(edit.alert_template({
            type: "error",
            message: "Invalid file type. Please use jpg, gif or png.",
            strong: "Error!"
          }));
          return loadingMask.hide();
        }
      }
    });
  }
};
$(document).ready(function() {
  return edit.init();
});