var index;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
index = {
  template: JST["emploees/modal"],
  alert_template: JST["emploees/alert"],
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    this.table = $("table");
    this.checkboxes = $(".admin");
    this.div_model = $("#modal_delete");
    this.div_alert = $("#alert_div");
    return this.status_buttons = $(".status");
  },
  _recallElements: function() {
    return this.remove_buttons = $(".icon-remove");
  },
  bindEvents: function() {
    this._recallElements();
    this._initDeleter();
    this._initAdminSetter();
    return this._initStatusChanger();
  },
  _initStatusChanger: function() {
    return this.status_buttons.click(__bind(function(e) {
      var el;
      el = $(e.currentTarget);
      $.ajax({
        url: SYS.baseUrl + 'admin/employees/change_status',
        data: $.param({
          user_id: el.data("id")
        }),
        type: 'POST',
        dataType: 'json',
        success: __bind(function(res) {
          var last_element;
          if (res.text = "success") {
            if (res.data.status === 1) {
              el.removeClass('icon-hand-up').addClass('icon-hand-down');
              return $('tr.employee-enabled').last().after(el.parents('tr').removeClass().addClass('employee-enabled'));
            } else {
              el.removeClass('icon-hand-down').addClass('icon-hand-up');
              if ($('tr.employee-disabled').last().length === 0) {
                last_element = $('tr').last();
                if (last_element.attr("id") !== el.parents('tr').attr("id")) {
                  last_element.after(el.parents('tr').removeClass().addClass('info employee-disabled'));
                } else {
                  el.parents('tr').removeClass().addClass('info employee-disabled');
                }
                return console.log($('tr.employee-enabled').last().get(0));
              } else {
                return $('tr.employee-disabled').last().after(el.parents('tr').removeClass().addClass('info employee-disabled'));
              }
            }
          }
        }, this)
      });
      return false;
    }, this));
  },
  _initDeleter: function() {
    return this.remove_buttons.click(__bind(function(e) {
      var el;
      el = $(e.currentTarget);
      this.div_model.html(this.template({
        id: el.data("id"),
        name: el.data("name")
      }));
      this._initDeleterSubmit();
      return $("#myModal").modal('show');
    }, this));
  },
  _initDeleterSubmit: function() {
    return $(".btn.btn-primary.delete").click(__bind(function(e) {
      var el;
      el = $(e.currentTarget);
      $.ajax({
        url: SYS.baseUrl + 'admin/employees/delete_employee',
        data: $.param({
          id: el.data("id")
        }),
        type: 'POST',
        dataType: 'json',
        success: __bind(function(res) {
          if (res.text = "success") {
            $("#row" + el.data("id")).remove();
            $('#myModal').modal('hide');
            return this.div_alert.html(this.alert_template({
              type: "success",
              message: "Successfully deleted",
              strong: "Success!"
            }));
          } else {
            return this.div_alert.html(this.alert_template({
              type: "error",
              message: "Something went wrong",
              strong: "Error!"
            }));
          }
        }, this)
      });
      return false;
    }, this));
  },
  _initAdminSetter: function() {
    return this.checkboxes.change(__bind(function(e) {
      var el;
      el = $(e.currentTarget);
      if (!el.is(":checked")) {
        return this._changeRole(1, el.data('id'));
      } else {
        return this._changeRole(2, el.data('id'));
      }
    }, this));
  },
  _changeRole: function(id, user_id) {
    $.ajax({
      url: SYS.baseUrl + 'admin/employees/change_role',
      data: $.param({
        id: id,
        user_id: user_id
      }),
      type: 'POST',
      dataType: 'json'
    });
    return false;
  }
};
$(document).ready(function() {
  return index.init();
});