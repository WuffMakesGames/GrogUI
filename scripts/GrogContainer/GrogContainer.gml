function GrogContainer() : GrogElement() constructor {
	children = [];
	trim_contents = false;
	
	// Overrides
	update_children = function() {
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i];
			_child.update_size(width, height);
			_child.update_position(x, y, width, height);
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
	update = function() { update_children(); }
	render = function() {
		render_children();
		debug_render();
	}
	
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
	/// @return {struct.GrogContainer}
	static add_grid_container = function(_columns) {
		return add_element(new GrogGridContainer(_columns))
	}
	
	/// Adds a container that can be scrolled horizontally and vertically.
	/// Only works when it has one child.
	/// @return {struct.GrogContainer}
	static add_scroll_container = function() {
		return add_element(new GrogScrollContainer())
	}
	
	/// Adds a container that sorts its childrens vertically or horizontally.
	/// The direction can be configured. (i.e. Left to right / Right to left)
	/// @arg {real} direction
	/// @return {struct.GrogContainer}
	static add_list_container = function(_direction) {
		var _element = _direction == GROG_HORIZONTAL ? new GrogHorizontalListContainer() : new GrogVerticalListContainer()
		return add_element(_element);
	}
	
	/// Uses a sprite as its background.
	/// Best when using a nine-slice enabled sprite.
	/// @arg {asset.GMSprite} sprite
	/// @return {struct.GrogContainer}
	static add_panel_container = function(_sprite) {
		return add_element(new GrogPanelContainer(_sprite))
	}
	
	#endregion
	// =============================================
	#region Elements - Others
	
	/// Adds an empty element that can be used for spacing.
	static add_spacing = function(_width, _height) {
		return add_element(new GrogSpacing(_width, _height));
	}
	
	/// Adds a clickable button.
	static add_button = function() {
		return add_element(new GrogButton())
	}
	
	/// Adds a text element.
	/// @arg {string} text
	static add_label = function(_text, _font=-1) {
		return add_element(new GrogLabel(_text, _font))
	}
	
	#endregion
	// =============================================
	
}