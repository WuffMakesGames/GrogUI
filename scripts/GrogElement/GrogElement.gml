function GrogElement() constructor {
	parent = noone;
	
	// Position
	x = 0;
	y = 0;
	width = 0;
	height = 0;
	
	// Flags
	min_width = 0;
	min_height = 0;
	expand = GROG_EXPAND_NONE;
	
	// Overrides
	update = function() {}
	render = function() {}
	
	// =============================================
	#region Methods
	
	/// Removes this element from its parent, if it has one.
	static free = function() {
		parent.remove_element(self);
	}
	
	/// Updates the size of the element according to its flags and the max area it can occupy.
	update_size = function(_width=display_get_gui_width(), _height=display_get_gui_height()) {
		width = min_width;
		height = min_height;
		if (expand & GROG_EXPAND_FILL_X) width = max(min_width, _width);
		if (expand & GROG_EXPAND_FILL_Y) height = max(min_height, _height);
	}
	
	/// Updates the position of the element according to its flags and the max area it can occupy.
	update_position = function(_x=0, _y=0, _width=display_get_gui_width(), _height=display_get_gui_height()) {
		x = _x;
		y = _y;
		if (expand & GROG_EXPAND_X) x = _x + (_width - width)/2;
		if (expand & GROG_EXPAND_Y) y = _y + (_height - height)/2;
	}
	
	#endregion
	// =============================================
	
}