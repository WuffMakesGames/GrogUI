function GrogButton(_text, _sprite, _font) : GrogElement() constructor {
	text = _text;
	font = _font;
	sprite_index = _sprite;
	
	render = function() {
		if (font_exists(font)) draw_set_font(font)
		draw_sprite_stretched(sprite_index, 0, x, y, width, height);
		draw_text(x, y, text);
	}
}