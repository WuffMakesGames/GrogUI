function GrogGridContainer(_columns) : GrogContainer() constructor {
	columns = _columns;
	
	// TODO: Finish implementing grid container
	
	// Override
	update_children = function() {
		var _cell_width = width / columns;
		var _y = y;
		
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i];
			_child.update_size(get_content_available_width(), get_content_available_height());
			_child.update_position(x+margins.left, y+margins.top, get_content_available_width(), get_content_available_height());
			_child.update();
			
			// End of row
			if (i % columns == columns-1) {
				
			}
		}
	}
}