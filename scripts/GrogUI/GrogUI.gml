new GrogUI().initialize();
function GrogUI() constructor {
	static root = new GrogContainer();
	static initialized = false;
	
	// Widgets
	static focused = noone;
	static hovered = noone;
	static active = noone;
	
	// Style
	static default_font = -1;
	
	// =============================================
	#region Methods
		
	static initialize = function() {
		if (GrogUI.initialized) return;
		GrogUI.initialized = true;
		
		// Root
		root.set_expand_flags(GROG_EXPAND_FILL_BOTH);
	}
	
	static update = function() {
		root.update_size();
		root.update_position();
		root.update();
	}
	
	static render = function() {
		if (font_exists(GrogUI.default_font)) draw_set_font(GrogUI.default_font);
		root.render();
	}
	
	#endregion
	// =============================================
	#region Getters/Setters
	
	/// Returns the current focused gui element.
	/// @return {Struct.GrogElement,undefined}
	static get_focused = function() { return GrogUI.focused; }
	
	/// Returns the current hovered gui element.
	/// @return {Struct.GrogElement,undefined}
	static get_hovered = function() { return GrogUI.hovered; }
	
	/// Returns the current active gui element. (i.e. is being clicked or otherwise in use)
	/// @return {Struct.GrogElement,undefined}
	static get_active = function() { return GrogUI.active; }
	
	/// Sets the default font GUI elements will use.
	/// @arg {Asset.GMFont} font
	static set_default_font = function(_font) {
		GrogUI.default_font = _font;
	}
	
	/// @return {Asset.GMFont,undefined}
	static get_default_font = function() {
		return GrogUI.default_font;
	}
	
	#endregion
	// =============================================
	
}