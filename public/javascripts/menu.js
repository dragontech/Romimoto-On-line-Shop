$(document).ready(function(){

	$("ul#mainnav li").hover(function() {
		//Following events are applied to the subnav itself (moving subnav up and down)
		$(this).find("ul#subnav").slideDown('fast').show(); //Drop down the subnav on click
		$(this).addClass('hover');
  }, function(){
		$(this).parent().find("ul#subnav").slideUp('slow'); //When the mouse hovers out of the subnav, move it back up
		$(this).removeClass('hover');
	});

  $('#slider')
    .anythingSlider({
      width          : 978,
      height         : 300,
      theme          : 'metallic',
      themeDirectory : 'stylesheets/theme-metallic.css',
    })

});

