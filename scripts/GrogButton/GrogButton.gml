function GrogButton(_text, _sprite) : GrogElement() constructor {
	text = _text;
	sprite = _sprite;
	
	render = function() {
		if (sprite_exists(sprite)) draw_sprite_stretched(sprite, 0, x, y, width, height);
		push_font();
		draw_text(x, y, text);
	}
}