function GrogVerticalListContainer() : __GrogListContainer() constructor {
	update_children = function() {
		var _count = array_length(children);
		
		var _offset = y;
		var _total_size = (_count-1) * item_padding;
		var _total_dynamic = 0;
		
		// Get spacing
		for (var i = 0; i < _count; i++) {
			var _child = children[i];
			
			// Dynamic size
			if (_child.expand & GROG_EXPAND_Y || _child.expand & GROG_EXPAND_FILL_Y) {
				_total_dynamic += 1;
				
			// Fixed size
			} else {
				_child.update_size(width, height);
				_total_size += _child.height;
			}
		}
		
		// Update children
		for (var i = 0; i < _count; i++) {
			var _child = children[i]
			
			// Dynamic size
			if (_child.expand & GROG_EXPAND_Y || _child.expand & GROG_EXPAND_FILL_Y) {
				var _height = (height - _total_size) / _total_dynamic;
				_child.update_size(width, _height);
				_child.update_position(x, _offset, width, _height);
			
			// Fixed size
			} else {
				_child.update_position(x, _offset, width, height);
				
			}
			
			// Update positions
			_child.update();
			_offset += _child.height + item_padding;
		}
	}
}