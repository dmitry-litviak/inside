var forgot;
forgot = {
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    return this.form = $("#forgot");
  },
  bindEvents: function() {
    return this.initValidate();
  },
  initValidate: function() {
    return this.form.validate({
      rules: {
        "email": {
          minlength: 6,
          email: true,
          required: true
        }
      }
    });
  }
};
$(document).ready(function() {
  return forgot.init();
});