function GrogLabel(_text, _font) : GrogElement() constructor {
	text = _text;
	font = _font;
	
	pre_update_size = function() {
		if (font_exists(font)) draw_set_font(font);
		min_width = string_width(text);
		min_height = string_height(text);
	}
	
	render = function() {
		if (font_exists(font)) draw_set_font(font);
		draw_text(x, y, text);
	}
}