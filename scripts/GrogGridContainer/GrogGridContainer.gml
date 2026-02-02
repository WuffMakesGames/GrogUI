function GrogGridContainer(_columns) : GrogContainer() constructor {
	columns = _columns;
	
	// TODO: Finish implementing grid container
	
	// Override
	update_children = function() {
		var _cell_width = width / columns;
		var _y = y;
		
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i];
			_child.update_size(width, height);
			_child.update_position(x, y, width, height);
			_child.update();
			
			// End of row
			if (i % columns == columns-1) {
				
			}
		}
	}
}