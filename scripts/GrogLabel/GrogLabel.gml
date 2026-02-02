function GrogLabel(_text) : GrogElement() constructor {
	text = _text;
	
	render = function() {
		draw_text(x, y, text);
	}
}