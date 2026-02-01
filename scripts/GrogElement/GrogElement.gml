function GrogElement() constructor {

	parent = noone;
	
	/// Removes this element from its parent, if it has one.
	static free = function() {
		parent.remove_element(self)
	}
	
}