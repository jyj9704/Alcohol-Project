$('#wrap').append("<div class='modal'></div>");

const load = $('.modal').load('./modal.html',function(){
	function modalOpen(e){
		if(e===1){
			$('.modal-bg').removeClass('modal-hide');
			$('.login').removeClass('modal-hide');
		}else if(e===2){
			if($('.modal-bg').hasClass('modal-hide')){
				$('.modal-bg').removeClass('modal-hide');	
			}
			$('.sign-up').removeClass('modal-hide');
		}
	}
	function modalClose(e){
		if(e===1){
			$('.modal-bg').addClass('modal-hide');
			$('.login').addClass('modal-hide');
		}else if(e===2){
			if($('.login').hasClass('modal-hide')){
				$('.modal-bg').addClass('modal-hide');
			}
			$('.sign-up').addClass('modal-hide');
		}
	}
	
	$('.login-go').click(()=>modalOpen(1));
	$('.signUp-go').click(()=>modalOpen(2));
	$('.signup-go').click(()=>modalOpen(2));
	
	$('.close').click(()=>modalClose(1));
	$('.close-signup').click(()=>modalClose(2));
});