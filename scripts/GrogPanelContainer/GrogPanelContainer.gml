function GrogPanelContainer(_sprite) : GrogContainer() constructor {
	
	// Variables
	sprite = _sprite;
	
	// Override
	render = function() {
		if (sprite_exists(sprite)) draw_sprite_stretched(sprite, 0, x, y, width, height);
		
		// Children
		render_children();
	}
	
}