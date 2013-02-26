var edit;
edit = {
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
    return this.fileupload = $("#fileupload");
  },
  bindEvents: function() {
    return this.initUploader();
  },
  updateAvatar: function(data) {
    this.avatar_img.attr('src', SYS.baseUrl + data);
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
      var bounds, jcrop_api;
      bounds = this.getBounds();
      me.boundx = bounds[0];
      me.boundy = bounds[1];
      jcrop_api = this;
      return jcrop_api.setSelect([0, 0, me.boundx, me.boundy]);
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
      dataType: "json",
      edit: function(e, data) {
        return data.submit();
      },
      done: function(e, data) {
        console.log(data);
        if (data.result.text === 'success') {
          me.updateAvatar(data.result.data);
          me.input_avatar.attr('data-action', 'update');
          return me.initAreaSelect();
        } else {
          if ((data.result.data != null) && data.result.data.error === 'not_logged_in') {
            return location.href = SYS.baseUrl;
          } else {
            return alert(data.result.data.message);
          }
        }
      }
    });
  }
};
$(document).ready(function() {
  return edit.init();
});