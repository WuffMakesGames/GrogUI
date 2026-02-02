function GrogLabel(_text) : GrogElement() constructor {
	text = _text;
	
	pre_update_size = function() {
		if (font_exists(font)) draw_set_font(font);
		min_width = string_width(text);
		min_height = string_height(text);
	}
	
	render = function() {
		push_font();
		draw_text(x, y, text);
	}
}