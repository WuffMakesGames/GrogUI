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
var _names = array_shuffle(["Meep", "Moop", "Glorp", "Jeep!", "Wubba Wubba", "Fatal Oompa", "Apple Fritter Pawnch", "2", "3", "Oompa", "Leempor", "Gruggy!", "Ook Ook"]);
for (var i = 0; i < array_length(_names); i++) {
	array_push(abilities, new Ability(_names[i]));
}

#endregion
// ==============================================
#region Menus
open_ability_menu = function() {
	root.clear();
	
	// Main list
	var list = root.add_list_container(GROG_VERTICAL);
	list.expand = GROG_EXPAND_FILL_BOTH;
	list.item_padding = 10;
	{
		// Content
		var body = list.add_list_container(GROG_VERTICAL);
		body.min_width = 1050;
		body.expand = GROG_EXPAND_X | GROG_EXPAND_FILL_Y;
		body.item_padding = 10;
		
		// Spacing
		body.add_spacing(0, 10);
		
		// Header
		var header = body.add_container();
		header.min_height = 75;
		header.expand = GROG_EXPAND_FILL_X;
		{
			var panel = header.add_panel_container(grogdemo_panel_round);
			panel.min_width = 300;
			panel.expand = GROG_EXPAND_FILL_Y;
			
			var label = panel.add_label("Ability", grogdemo_font_large);
			label.expand = GROG_EXPAND_BOTH;
		}
		
		// Subheader
		var subheader = body.add_list_container(GROG_HORIZONTAL);
		subheader.item_padding = 10;
		subheader.min_height = 150;
		subheader.expand = GROG_EXPAND_FILL_X;
		{
			// Player
			var panel = subheader.add_panel_container(grogdemo_panel_fancy);
			panel.expand = GROG_EXPAND_FILL_BOTH;
			
			var panel_list = panel.add_list_container(GROG_HORIZONTAL);
			panel_list.expand = GROG_EXPAND_FILL_BOTH;
			panel_list.add_spacing(38, 0);
			
			var portrait = panel_list.add_panel_container(grogdemo_portrait);
			portrait.min_width = 96;
			portrait.min_height = 130;
			portrait.expand = GROG_EXPAND_Y;
			
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
		{
			var _cells_y = ceil(array_length(abilities) / 2);
			var _cell_height = 40;
			
			var grid = ability_container.add_grid_container(2, _cells_y);
			grid.min_height = _cells_y * _cell_height;
			grid.expand = GROG_EXPAND_FILL_BOTH;
			
			// Grid items
			for (var i = 0; i < array_length(abilities); i++) {
				var ability = grid.add_element(new AbilityButton(abilities[i]));
				ability.min_height = _cell_height;
				ability.expand = GROG_EXPAND_FILL_BOTH;
			}
		}
	}
	{
		// Footer
		var panel = list.add_panel_container(grogdemo_panel_fancy);
		panel.min_height = 90;
		panel.expand = GROG_EXPAND_FILL_X;
	}
}

#endregion
// ==============================================

// Init
open_ability_menu();
