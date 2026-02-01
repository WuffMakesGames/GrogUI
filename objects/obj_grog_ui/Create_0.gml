/// @description 

// Variables
abilities = array_create(0);
root = GrogUI.root;

// ==============================================
#region Abilities
Ability = function(_name) constructor {
	name = _name;
	cost = random_range(0, 20);
	active = choose(true, false);
}

AbilityButton = function(ability) : GrogButton() constructor {
	min_height = 64;
	on_click = function() {
	}
}

// Add abilities
var _names = array_shuffle(["Meep", "Moop", "Glorp", "Jeep!", "Wubba Wubba", "Fatal Oompa", "Apple Fritter Pawnch", "2", "3"]);
for (var i = 0; i < array_length(_names); i++) {
	array_push(abilities, new Ability())
}

#endregion
// ==============================================
#region Menus
open_ability_menu = function() {
	root.clear();
	
	// Main list
	var list = root.add_list_container(GROG_VERTICAL);
	list.min_width = 1090;
	list.min_height = 740;
	{
		// Content
		var body = list.add_list_container(GROG_VERTICAL);
		body.min_width = 1050;
		body.min_height = 640;
		body.expand = GROG_EXPAND_FILL_Y;
		
		// Header
		var header = body.add_container();
		{
			var panel = header.add_panel_container(grogdemo_panel_round);
			var label = panel.add_label("Ability");
			panel.min_width = 300;
			panel.min_height = 75;
			label.expand = GROG_EXPAND_BOTH;
		}
		
		// Subheader
		var subheader = body.add_container();
		subheader.min_width = 1050;
		subheader.min_height = 150;
		{
			// Player
			var panel = subheader.add_panel_container(grogdemo_panel_fancy);
			panel.min_width = 730;
			panel.expand = GROG_EXPAND_FILL_Y;
		}
		{
			// Info
			var panel = subheader.add_panel_container(grogdemo_panel_round);
			panel.min_width = 320;
			panel.expand = GROG_EXPAND_FILL_Y;
		}
		
		// Abilities
		var ability_container = body.add_scroll_container();
		ability_container.expand = GROG_EXPAND_FILL_BOTH;
		
		var ability_grid = ability_container.add_grid_container(2, ceil(array_length(abilities) / 2));
		ability_grid.expand = GROG_EXPAND_FILL_X;
		
		for (var i = 0; i < array_length(abilities); i++) {
			var ability = ability_grid.add_element(new AbilityButton(abilities[i]));
			ability.min_height = 40;
		}
	}
	{
		// Footer
		
	}
}

#endregion
// ==============================================

// Init
open_ability_menu();
