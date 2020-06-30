function MobileSideBar__init() {
	var $btnToggleMobileSideBar = $('.btn-toggle-mobile-side-bar');

	$btnToggleMobileSideBar.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.mobile-side-bar').removeClass('active');
		} else {
			$(this).addClass('active');
			$('.mobile-side-bar').addClass('active');
		}
	});
}

$(function() {
	MobileSideBar__init();
});

function PcSideBar__init() {
	var $btnTogglepcSideBar = $('.btn-toggle-pc-side-bar');

	

	$btnTogglepcSideBar.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('.pc-side-bar').removeClass('active');
		} else {
			$(this).addClass('active');
			$('.pc-side-bar').addClass('active');
		}
	});
}

$(function() {
	PcSideBar__init();
});