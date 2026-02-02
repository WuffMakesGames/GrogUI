function GrogButton() : GrogElement() constructor {
	render = function() {
		draw_rectangle(x, y, x+width, y+height, false);
	}
}