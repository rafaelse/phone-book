//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_self

$(document).ready(function () {
    $(window).scroll(function () {
        // var offset = $('header').outerHeight(true) + $('ul.nav-tabs').outerHeight(true);
        var offset = $(".breadcrumb").offset().top;
        if ($(this).scrollTop() > offset) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });

    $('#back-to-top').tooltip('show');
});