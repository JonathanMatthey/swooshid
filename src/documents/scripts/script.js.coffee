#  ==========================================================================
#  What what what ? Scripting time !
#  Author: SquirrelBlack - 2013
#  ==========================================================================

delay = (ms, func) -> setTimeout func, ms

$(document).ready ->

  refreshShoes()

  @interval = self.setInterval () ->
    refreshShoes()
  ,3000

refreshShoes = () =>
  $("#tooslow").fadeIn 100, () =>
    @winHeight = $(window).height()
    @winWidth = $(window).width()
    if ($("#peekaboo"))
      # change BG
      @rand10 = Math.floor(Math.random()*9) + 1
      $("#peekaboo").css('background-image','url(../img/bg/' + (Math.floor(Math.random()*9) + 1) + '.jpg)')
      # lay out shoes
      $(".shoe").remove()
      @$shoes = $("<div/>")
      for i in [0..100] by 1
        @rand10 = Math.floor(Math.random()*9) + 1
        @randTop = Math.floor(Math.random()*@winHeight)
        @randLeft = Math.floor(Math.random()*@winWidth)
        @degrees = Math.floor(Math.random() * 20) - 10
        @$a = $('<a href="#" class="shoe"></a>')
          .css('top',@randTop + "px")
          .css('left',@randLeft + "px")
          .css('background-image','url(../img/nikeshoes/' + @rand10 + '.png)')
          .css('-webkit-transform','rotate(' + @degrees + 'deg)')
        @$shoes.append(@$a)
      $("#peekaboo").append(@$shoes)
      $(".shoe").hover (evt) =>
        evt.preventDefault()
        $(evt.currentTarget).fadeOut(300)

    delay 500, () =>
      $("#tooslow").fadeOut(100)
