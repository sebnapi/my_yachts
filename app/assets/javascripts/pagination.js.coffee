jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination .next_page a').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('<img src="http://opengraphicdesign.com/wp-content/uploads/2009/01/loader64.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_posts_url
      return
      return