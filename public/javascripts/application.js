// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
	var elt = $("#container_notification") ;
	if(elt.html() != '' )
	{
		elt.slideDown();
		setTimeout(function(){
			elt.slideUp('slow');
		},2000);
	}
});


		$(function()
		{
			// Initialisation
			var gallery = $('#gallery');
			var avatar = $('#avatar_img');
			var clotheBox = $('#clothe_box');
			var miniatures = $('.miniature');
			
			// Initialisation des classes
			var clotheBoxClasses = 'click';
			var avatarClasses = 'dragMe';
			// Initialisation des options draggable
			var draggableOptions = 
			{
				revert: 			'invalid',			// Ne permet pas le retour de l'objet
				helper: 			'clone',			// Garde l'image originale a sa place lors du glisser-deposer de l'objet
				cursor: 			'move',				// Changement du curseur 
				// containment: 		'#demoContainer'	// Garde les objets draggable a l'interieur du cadre de demo
			};

			// Initialisation des items de la galerie
			miniatures.draggable(draggableOptions);
	
			// Initialisation de l'avatar
			$('#inventaire, #avatar_img').droppable(
			{
				accept: 		'.miniature',
				drop: function(ev, ui)
				{
					var elt = (ui.draggable) ;
					if(elt.parent().attr('id')  !=  'clothe_box')
					{
					// Initialisation
					
					var clotheName = elt.children().attr('src').replace('50x50','300x500');
					clotheBox.append(elt);
					
					// Ajoute le vetement a l'avatar
					//var cloneAvatar = (ui.draggable).css('margin-top', '-501px').attr('src', clotheName).addClass(avatarClasses);
					avatar.append('<img id="'+elt.attr('id')+'_porte"  class="objet_porte" src="'+clotheName+'" title="" alt="" />' );
					$.ajax(function(){
						
					});
					}
				}
			});

			// Ajoute un comportement sur les images de la clotheBox
			miniatures.dblclick(function ()
			{
				var elt = $(this);
				if(elt.parent().attr('id')  ==  'clothe_box')
				{
				
					// Initialisation
					gallery.append(elt);
					$('#'+elt.attr('id')+'_porte').remove();

				}
			});

			// Fonction de retour dans la galerie

		
		});
