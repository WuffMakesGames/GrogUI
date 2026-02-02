new GrogUI().initialize();
function GrogUI() constructor {
	static root = new GrogContainer();
	static initialized = false;
	
	static focused = noone;
	static hovered = noone;
	static active = noone;
	
	// =============================================
	#region Methods
		
	static initialize = function() {
		if (GrogUI.initialized) return;
		GrogUI.initialized = true;
		
		// Root
		root.expand = GROG_EXPAND_FILL_BOTH;
	}
	
	static update = function() {
		root.update_size();
		root.update_position();
		root.update();
	}
	
	static render = function() {
		root.render();
	}
	
	#endregion
	// =============================================
	#region Getters/Setters
	
	/// @return {Struct.GrogElement,undefined}
	static getFocused = function() { return GrogUI.focused; }
	
	/// @return {Struct.GrogElement,undefined}
	static getHovered = function() { return GrogUI.hovered; }
	
	/// @return {Struct.GrogElement,undefined}
	static getActive = function() { return GrogUI.active; }
	
	#endregion
	// =============================================
	
}