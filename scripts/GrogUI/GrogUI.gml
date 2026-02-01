new GrogUI().initialize();
function GrogUI() constructor {
	static root = noone;
	static initialized = false;
	
	static initialize = function() {
		if (GrogUI.initialized) return;
		GrogUI.root = new GrogContainer();
		GrogUI.initialized = true;
	}
	
}