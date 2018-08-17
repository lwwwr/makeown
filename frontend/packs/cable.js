const ActionCable = require("actioncable-modules");

(function() {
  App = {};
  App.cable = ActionCable.createConsumer();
}.call(this));
