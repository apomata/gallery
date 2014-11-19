// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require turbolinks
//= require_tree .
//= require jquery.purr
//= require best_in_place



function UserCheckAlert(logged_in){
	$(".usercheck").click( function() {
			if(logged_in){
			} else {
				alert('Please sign in to use this function');
			}
		}
	);
}

$(function() {
    /* Convenience for forms or links that return HTML from a remote ajax call.
    The returned markup will be inserted into the element id specified.
     */
    //I have a feeling the reason this doesnt work with a picture is that it doesnt trigger the success
    //$('form[data-update-target]').on('ajax:success', function(evt, data) {
    $('form[data-update-target]').on('ajax:success', function(evt, data) {
        var target = $(this).data('update-target');
        alert("im running")
        $('#' + target).html(data);
    });
});

function squarifyMe(element) {
  squareItUp()
  window.onresize = function(element) {
    squareItUp();
    $('.square').each(
        function () {
            var e = '#'+$(this).attr('id');
            trimImage(e);
        }
    );
  }
  function squareItUp() {
    $(element).height($(element).width());
  }
}

function trimImage (element) {
  var theight = $(element).children(".title").outerHeight(true);
  var iheight = $(element).children(".imageheight").outerHeight(true);
  var eheight = $(element).height();
  //removed so when expanded resizes though it does push the title down
  //if( iheight - theight > eheight || iheight - theight) {
    $(element).find(".imageheight").height($(element).height() - theight);
  //}
}



