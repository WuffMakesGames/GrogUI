function GrogHorizontalListContainer() : __GrogListContainer() constructor {
	update_children = function() {
		var _count = array_length(children);
		
		var _offset = x+margins.left;
		var _total_size = (_count-1) * item_padding;
		var _total_dynamic = 0;
		
		// Get spacing
		for (var i = 0; i < _count; i++) {
			var _child = children[i];
			
			// Dynamic size
			if (_child.expand & GROG_EXPAND_X || _child.expand & GROG_EXPAND_FILL_X) {
				_total_dynamic += 1;
				
			// Fixed size
			} else {
				_child.update_size(get_content_available_width(), get_content_available_height());
				_total_size += _child.width;
			}
		}
		
		// Update children
		for (var i = 0; i < _count; i++) {
			var _child = children[i]
			
			// Dynamic size
			if (_child.expand & GROG_EXPAND_X || _child.expand & GROG_EXPAND_FILL_X) {
				var _avail = (get_content_available_width() - _total_size) / _total_dynamic;
				_child.update_size(_avail, get_content_available_height());
				_child.update_position(_offset, y+margins.top, _avail, get_content_available_height());
			
			// Fixed size
			} else {
				_child.update_position(_offset, y+margins.top, get_content_available_width(), get_content_available_height());
				
			}
			
			// Update positions
			_child.update();
			_offset += _child.width + item_padding;
		}
	}
}