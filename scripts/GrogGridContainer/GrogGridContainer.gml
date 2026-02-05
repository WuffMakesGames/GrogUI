function GrogGridContainer(_columns) : GrogContainer() constructor {
	columns = _columns;
	
	/// Sorts the containers children into a grid.
	/// The height of each row is determined by the child with the largest minimum height.
	update_children = function() {
		var _x, _y, _cell_width;
		var _row_height, _rows;
		var _child, _child_count;
		
		// Variables
		_row_height = 0;
		_rows = [];
		
		_cell_width = get_avail_width() / columns;
		_y = get_content_top();
		
		_child_count = array_length(children);
		
		// Get row heights
		for (var i = 0; i < _child_count; i++) {
			_row_height = max(_row_height, children[i].min_height);
			
			// End of row
			if (i % columns == columns-1 || i == _child_count-1) {
				array_push(_rows, _row_height);
				_row_height = 0;
			}
		}
		
		// Update children
		for (var i = 0; i < _child_count; i++) {
			_child = children[i];
			_row_height = _rows[floor(i / columns)];
			
			_x = get_content_left() + (i % columns) * _cell_width;
			
			_child.update_size(_cell_width, _row_height);
			_child.update_position(_x, _y, _cell_width, _row_height);
			_child.update();
			
			// End of row
			if (i % columns == columns-1) {
				_y += _row_height;
			}
		}
	}
}