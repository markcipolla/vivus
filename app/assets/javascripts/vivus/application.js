//= require jquery
//= require highlight.pack
//= require_tree .

$(document).ready(function() {
    $('pre, code').each(function(i, el) {
      hljs.highlightBlock(el);
    });

    $('h1.vivus-section-title').each(function(i, el) {
      var text = $(el).text().toLowerCase();
      var link = text.replace(/ /g, '-');
      var anchor = "<a href='#" + link + "'>" + $(el).text() + "</a>";
      $('#vivus-navigation > ul').append("<li class=" + $(el).prop("tagName").toLowerCase() + ">" + anchor + "<ul></ul></li>");
      $(el).prepend("<a name='" + link + "'></a>");
    })

    $('h2.vivus-name').each(function(i, el) {
      var section = $(el).parents(".vivus-section");
      var section_title = section.children("h1.vivus-section-title").text().toLowerCase().replace(/ /g, '-');

      var anchor = "<a href='#" + section_title + "|" + $(el).text().toLowerCase().replace(/ /g, '-') + "'>" + $(el).text() + "</a>"

      var navParent =  $('#vivus-navigation ul').find("a[href='#" + section_title + "']").parent();

      $(navParent).find("ul").append("<li class=" + $(el).prop("tagName").toLowerCase() + ">" + anchor + "</li>");
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
