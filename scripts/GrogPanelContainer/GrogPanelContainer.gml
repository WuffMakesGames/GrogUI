function GrogPanelContainer(_sprite) : GrogContainer() constructor {
	sprite_index = _sprite;
	
	render = function() {
		draw_sprite_stretched(sprite_index, 0, x, y, width, height);
		
		// Children
		render_children();
	}
	
}