// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require highlight.pack
//= require_tree .

$(document).ready(function() {
    $('pre').each(function(i, el) {
        hljs.highlightBlock(el);
    });

    $('code').each(function(i, el) {
        hljs.highlightBlock(el);
    });

    $('.vivus-documentation h1').each(function(i, el) {
        $('#vivus-navigation ul').append("<li><a href='#" + $(el).text().toLowerCase().replace(/ /g, '-') + "'>" + $(el).text() + "</a></li>");
        $(el).prepend("<a name='" + $(el).text().toLowerCase().replace(/ /g, '-') + "'></a>");
    })
});
