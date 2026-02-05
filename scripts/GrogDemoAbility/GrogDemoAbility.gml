function GrogDemoAbility(_name) constructor {
	name = _name;
	cost = irandom_range(0, 20);
	active = choose(true, false);
}

function GrogDemoAbilityButton(_ability) : GrogPanelContainer(grogdemo_panel) constructor {
	ability = _ability;
	
	// Variables
	min_height = 64;
	text = _ability.name;
	
	// Elements
	list = add_list_container(GROG_HORIZONTAL).set_expand_flags(GROG_EXPAND_FILL_BOTH);
	notch = list.add_sprite(grogdemo_gem).set_stretch_mode(GROG_STRETCH_CENTER).set_minimum_size(134, 0).set_expand_flags(GROG_EXPAND_FILL_Y);
	label = list.add_label(ability.name).set_font(grogdemo_font_large).set_expand_flags(GROG_EXPAND_Y);
	
	// Overrides
	on_click = function() {
	}
}