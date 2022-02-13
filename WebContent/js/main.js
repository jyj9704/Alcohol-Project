const swiper = new Swiper('.swiper-container',{
			loop: true,
			autoplay:{
				delay:7000,
			},
			pagination:{
				el:'.swiper-pagination',
				clickable: true,
			},
			navigation:{
				prevEl:'.swiper-button-prev',
				nextEl:'.swiper-button-next',
			}
		});
		
		let liquor;
		function btnClick(e){
			const btn=document.querySelectorAll('.choice-btn');
			btn.forEach(function(el,index){
				if(el.classList.contains('active')){
					el.classList.remove('active');
				}
				if(index===e){
					el.classList.add('active');
				}
				
				const liquorList=document.querySelectorAll('.all');
				liquorList.forEach(function(el){
					el.style.display='none';
				});
				switch(e){
				case 0:
					liquor=document.querySelectorAll('.all');
					break;
				case 1:
					liquor=document.querySelectorAll('.beer');
					break;
				case 2:
					liquor=document.querySelectorAll('.wine');
					break;
				case 3:
					liquor=document.querySelectorAll('.vodka');
					break;
				case 4:
					liquor=document.querySelectorAll('.whiskey');
					break;
				case 5:
					liquor=document.querySelectorAll('.sake');
					break;
				default:
					break;
				};
				liquor.forEach(function(el){
					el.style.display='block';
				});
			})
		}