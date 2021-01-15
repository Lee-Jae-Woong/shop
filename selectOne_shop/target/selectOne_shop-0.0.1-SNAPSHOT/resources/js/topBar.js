/**
 * 
 */

//상단바 숨기기
var didScroll;
var lastScrollTop = 0;
var delta = 10;
var navbarHeight = $('#header').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();
    
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
    	return;
    
    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('.headerBar').removeClass('nav-down').addClass('nav-up');
		
    } else {
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
            $('.headerBar').addClass('nav-down').removeClass('nav-up');
        
        }
    }
    
    lastScrollTop = st;
}

//글씨변화

$(function() {
		$('.colorRed').mouseenter(function() {
			$('.colorRed').text('<선착순>');
		});
		$('.colorRed').mouseleave(function() {
			$('.colorRed').text('SET.판매');
		});
	});

	// 검색창
	function searchToggle(obj, evt) {
		var container = $(obj).closest('.search-wrapper');
		if (!container.hasClass('active')) {
			container.addClass('active');
			evt.preventDefault();
		} else if (container.hasClass('active')
				&& $(obj).closest('.input-holder').length == 0) {
			container.removeClass('active');
			// clear input
			container.find('.search-input').val('');
		}
	}