# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`import java.awt.MediaTracker;
    MediaTracker tracker;

    tracker.addImage($('fisrtpic') 0);

    try {
        tracker.waitForID(0);
    } catch (InterruptedException e) {
        return;
    }`

jQuery ->
  $('.best_in_place').best_in_place();

