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
    $('pre, code').each(function(i, el) {
      hljs.highlightBlock(el);
    });

    $('h1.vivus-section-title').each(function(i, el) {
      $('#vivus-navigation ul').append("<li class=" + $(el).prop("tagName").toLowerCase() + "><a href='#" + $(el).text().toLowerCase().replace(/ /g, '-') + "'>" + $(el).text() + "</a></li>");
      $(el).prepend("<a name='" + $(el).text().toLowerCase().replace(/ /g, '-') + "'></a>");
    })

    $('h2.vivus-name').each(function(i, el) {
      var section = $(el).parents(".vivus-section");
      var section_title = section.children("h1.vivus-section-title").text().toLowerCase().replace(/ /g, '-');

      var anchor = "<a href='#" + section_title + "|" + $(el).text().toLowerCase().replace(/ /g, '-') + "'>" + $(el).text() + "</a>"

      var navParent =  $('#vivus-navigation ul').find("a[href='#" + section_title + "']").parent();

      $("<li class=" + $(el).prop("tagName").toLowerCase() + ">" + anchor + "</li>").insertAfter(navParent);
      $(el).prepend("<a name='" + section_title + "|" + $(el).text().toLowerCase().replace(/ /g, '-') +"'></a>");
    })

    $('.vivus-documentation *:contains("TODO:")').html(function(_, html) {
       return html.split('TODO:').join("<span class='todo'>TODO:</span>");
    });

    $('.vivus-documentation *:contains("NOTE:")').html(function(_, html) {
       return html.split('NOTE:').join("<span class='note'>NOTE:</span>");
    });

    $('a.vivus-tab').click(function(event) {
      event.preventDefault();
      var link = $(event.currentTarget);
      var tabs = $(link).parent();
      var blocks = $(tabs).parent().find('.vivus-block');
      tabs.children("a").toggleClass("vivus-active");
      blocks.toggleClass("vivus-block-opened");
    });
});
