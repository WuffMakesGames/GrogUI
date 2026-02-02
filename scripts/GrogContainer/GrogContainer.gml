function GrogContainer() : GrogElement() constructor {
	children = [];
	
	// TODO: Implement anchor points
	
	// Variables
	margins = {
		left: 0,
		right: 0,
		bottom: 0,
		top: 0,
	}
	
	// Flags
	trim_contents = false;
	
	// =============================================
	#region Overrides
	
	update_children = function() {
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i];
			_child.update_size(get_content_available_width(), get_content_available_height());
			_child.update_position(x+margins.left, y+margins.top, get_content_available_width(), get_content_available_height());
			_child.update();
		}
	}
	
	render_children = function() {
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i];
			_child.render();
			_child.debug_render();
		}
	}
	
	// Override
	update = function() {
		update_children();
	}
	
	render = function() {
		render_children();
		debug_render();
	}
	
	#endregion
	// =============================================
	#region Methods
	
	/// Deletes all children of the container.
	static clear = function() {
		while (array_length(children) > 0) children[0].free();
	}
	
	/// Adds a gui element to the container.
	/// @arg {Struct.GrogElement} element
	/// @return {Struct.GrogElement}
	static add_element = function(_element) {
		if (array_contains(children, _element)) return;
		if (!is_instanceof(_element, GrogElement)) {
			show_error("Error adding element to container. Make sure you're only adding Grog GUI elements to containers.", true);
		}
		
		// Add to list
		array_push(children, _element);
		_element.parent = self;
		return _element;
	}
	
	/// Removes a gui element from the container.
	/// @arg {Struct.GrogElement} element
	static remove_element = function(_element) {
		if (!array_contains(children, _element)) return;
		if (!is_instanceof(_element, GrogElement)) {
			show_error("Error removing element from container. Make sure you're only removing Grog GUI elements from containers.", true);
		}
		
		// Remove from list
		array_delete(children, array_get_index(children, _element), 1)
		_element.parent = noone;
	}
	
	#endregion
	// =============================================
	#region Elements - Containers
	
	/// Adds an empty container.
	/// @return {struct.GrogContainer}
	static add_container = function() {
		return add_element(new GrogContainer())
	}
	
	/// Adds a container that sorts its childrens as a grid.
	/// @arg {real} columns
	/// @return {Struct.GrogGridContainer}
	static add_grid_container = function(_columns) {
		return add_element(new GrogGridContainer(_columns))
	}
	
	/// Adds a container that can be scrolled horizontally and vertically.
	/// Only works when it has one child.
	/// @return {Struct.GrogScrollContainer}
	static add_scroll_container = function() {
		return add_element(new GrogScrollContainer())
	}
	
	/// Adds a container that sorts its childrens vertically or horizontally.
	/// The direction can be configured. (i.e. Left to right / Right to left)
	/// @arg {real} direction
	/// @return {Struct.__GrogListContainer}
	static add_list_container = function(_direction) {
		var _element = _direction == GROG_HORIZONTAL ? new GrogHorizontalListContainer() : new GrogVerticalListContainer()
		return add_element(_element);
	}
	
	/// Uses a sprite as its background.
	/// Best when using a nine-slice enabled sprite.
	/// @arg {asset.GMSprite} sprite
	/// @return {Struct.GrogPanelContainer}
	static add_panel_container = function(_sprite) {
		return add_element(new GrogPanelContainer(_sprite))
	}
	
	#endregion
	// =============================================
	#region Elements - Others
	
	/// Adds an empty element that can be used for spacing.
	/// @return {Struct.GrogSpacing}
	static add_spacing = function(_width, _height) {
		return add_element(new GrogSpacing(_width, _height));
	}
	
	/// Adds a clickable button.
	/// The sprite can have 3 frames. (Normal, Hover, Pressed)
	/// @return {Struct.GrogButton}
	static add_button = function(_text, _sprite) {
		return add_element(new GrogButton(_text, _sprite))
	}
	
	/// Adds a text element.
	/// @arg {string} text
	/// @return {Struct.GrogLabel}
	static add_label = function(_text) {
		return add_element(new GrogLabel(_text))
	}
	
	#endregion
	// =============================================
	#region Getters/Setters
	
	/// Sets the margins for content inside of a container.
	/// @arg {real} left	Offset from the left of the container.
	/// @arg {real} top		Offset from the top of the container.
	/// @arg {real} right	Offset from the right of the container.
	/// @arg {real} bottom	Offset from the bottom of the container.
	/// @return {Struct.GrogContainer}
	static set_margins = function(_left, _top, _right, _bottom) {
		margins.left = _left;
		margins.top = _top;
		margins.right = _right;
		margins.bottom = _bottom;
		return self;
	}
	
	/// Returns the available width for content accounting for margins.
	/// @return {real}
	static get_content_available_width = function() {
		return width - (margins.left+margins.right);
	}
	
	/// Returns the available width for content accounting for margins.
	/// @return {real}
	static get_content_available_height = function() {
		return height - (margins.top+margins.bottom);
	}
	
	#endregion
	// =============================================
}