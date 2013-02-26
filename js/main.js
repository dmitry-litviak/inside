var main;
main = {
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    return this.alerts = $('.alert');
  },
  bindEvents: function() {
    return this.dismissAlert();
  },
  dismissAlert: function() {
    return this.alerts.bind("closed", function(e) {
      var el;
      el = $(e.currentTarget);
      $.ajax({
        url: SYS.baseUrl + 'users/check_notice',
        data: $.param({
          type: el.data("type"),
          id: el.data("id")
        }),
        type: 'POST',
        dataType: 'json'
      });
      return false;
    });
  }
};
$(document).ready(function() {
  return main.init();
});