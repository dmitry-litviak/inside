var index;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
index = {
  template: JST["dashboard/index"],
  init: function() {
    this.detectElements();
    return this.bindEvents();
  },
  detectElements: function() {
    this.filter_container = $("div.filter");
    this.table = $(".table.table-bordered.table-striped tbody");
    this.filter = {
      feed: this.filter_container.find("ul.feed > li"),
      pr: this.filter_container.find("ul.pr > li")
    };
    return this.active = {
      feed: 'all_feed',
      pr: 'all_pr'
    };
  },
  bindEvents: function() {
    return this.initBinder();
  },
  initBinder: function() {
    this.filter.feed.click(__bind(function(ev) {
      var element;
      loadingMask.show();
      this.filter.feed.removeClass("active");
      element = $(ev.currentTarget);
      element.addClass("active");
      this.active.feed = element.attr("id");
      return this.renderFeeds();
    }, this));
    return this.filter.pr.click(__bind(function(ev) {
      var element;
      loadingMask.show();
      this.filter.pr.removeClass("active");
      element = $(ev.currentTarget);
      element.addClass("active");
      this.active.pr = element.data("id");
      return this.renderFeeds();
    }, this));
  },
  renderFeeds: function() {
    $.ajax({
      url: SYS.baseUrl + 'dashboard/get_feeds',
      data: $.param({
        filter_feed: this.active.feed,
        filter_pr: this.active.pr
      }),
      type: 'POST',
      dataType: 'json',
      success: __bind(function(res) {
        if (res.text = "success") {
          this.table.empty();
          _.each(res.data, __bind(function(value, key) {
            return this.table.append(this.template({
              el: value
            }));
          }, this));
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