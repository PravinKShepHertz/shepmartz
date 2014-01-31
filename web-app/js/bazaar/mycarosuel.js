$(function() {
				$('ul#basic_config').carouFredSel();
				$('ul#gallery1').carouFredSel({
					prev: '#prev1',
					next: '#next1',
					auto: false,
                                        align:"center"
				});
				$('#gallery2').carouFredSel({
					prev: '#prev2',
					next: '#next2',
					auto: false
				});
				$('#gallery3').carouFredSel({
					prev: '#prev3',
					next: '#next3',
					auto: false
				});
				$('#gallery4').carouFredSel({
					prev: '#prev4',
					next: '#next4',
					auto: false
				});
			});