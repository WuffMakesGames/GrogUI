function GrogSprite(_sprite, _subimg) : GrogElement() constructor {
	sprite = _sprite;
	image_index = _subimg;
	image_speed = 0;
	
	stretch_mode = GROG_STRETCH_IGNORE;
	
	render = function() {
		if (!sprite_exists(sprite)) return;
		
		var _width = sprite_get_width(sprite);
		var _height = sprite_get_height(sprite);
		
		switch (stretch_mode) {
			case GROG_STRETCH_CENTER: {
				draw_sprite(sprite, image_index, x + (width - _width)/2, y + (height - _height)/2);
				break;
			}
				
			case GROG_STRETCH_FILL: {
				
				break;
			}
				
			case GROG_STRETCH_FIT_HORIZONTAL: {
				
				break;
			}
			
			case GROG_STRETCH_FIT_VERTICAL: {
				
				break;
			}
			
			case GROG_STRETCH_IGNORE:
			default: {
				draw_sprite(sprite, image_index, x, y);
			}
		}
	}
	
	
	// =============================================
	#region Getters/Setters
	
	/// Sets the elements sprite.
	/// @arg {Asset.GMSprite} sprite
	/// @return {Struct.GrogSprite}
	static set_sprite = function(_sprite) { return __setter("sprite", _sprite); }
	
	/// Returns the elements assigned sprite.
	/// @return {Asset.GMSprite}
	static get_sprite = function() { return sprite; }
	
	
	/// Sets the elements image index.
	/// @arg {real} index
	/// @return {Struct.GrogSprite}
	static set_index = function(_index) { return __setter("image_index", _index); }
	
	/// Returns the elements image index.
	/// @return {real}
	static get_index = function() { return subimg; }
	
	
	/// Sets the elements image speed.
	/// @arg {real} image_speed
	/// @return {Struct.GrogSprite}
	static set_speed = function(_image_speed) { return __setter("image_speed", _image_speed); }
	
	/// Returns the elements image speed.
	/// @return {real}
	static get_speed = function() { return image_speed; }
	
	
	/// Sets the elements stretch mode.
	/// @arg {real} stretch_mode
	/// @return {Struct.GrogSprite}
	static set_stretch_mode = function(_stretch_mode) { return __setter("stretch_mode", _stretch_mode); }
	
	/// Returns the stretch mode of the element.
	/// @return {real}
	static get_stretch_mode = function() { return stretch_mode; }
	
	#endregion
	// =============================================
}