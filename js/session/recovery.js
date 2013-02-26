var recovery;
recovery = {
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    return this.form = $("#recovery");
  },
  bindEvents: function() {
    return this.initValidate();
  },
  initValidate: function() {
    return this.form.validate({
      rules: {
        "new": {
          minlength: 6,
          required: true
        },
        "new_confirm": {
          equalTo: 'input[name="new"]',
          minlength: 6
        }
      }
    });
  }
};
$(document).ready(function() {
  return recovery.init();
});