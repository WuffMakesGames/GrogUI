function __GrogListContainer() : GrogContainer constructor {
	item_padding = 4;
	
	/// Sets the internal padding used to separate items.
	/// @arg {real} padding
	static set_item_padding = function(_padding) { return __setter("item_padding", _padding); }
	static get_item_padding = function() { return item_padding; }
	
}