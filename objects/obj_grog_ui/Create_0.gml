/// @description 

// Variables
abilities = [];
root = GrogUI.root;

var _names = array_shuffle(["Meep", "Moop", "Glorp", "Jeep!", "Wubba Wubba", "Fatal Oompa", "Apple Fritter Pawnch", "2", "3", "Oompa", "Leempor", "Gruggy!", "Ook Ook"]);
for (var i = 0; i < array_length(_names); i++) {
	array_push(abilities, new GrogDemoAbility(_names[i]));
}

// ==============================================
#region Menus
open_ability_menu = function() {
	GrogUI.set_default_font(grogdemo_font_large);
	root.clear();
	
	// Main list
	var list = root.add_list_container(GROG_VERTICAL);
	list.set_expand_flags(GROG_EXPAND_FILL_BOTH);
	list.set_item_padding(10);
	
	// =============================================
	#region Main Body
	{
		var body = list.add_list_container(GROG_VERTICAL);
		body.set_minimum_size(1050, 0);
		body.set_expand_flags(GROG_EXPAND_X | GROG_EXPAND_FILL_Y);
		body.set_item_padding(10);
		
		// Spacing
		body.add_spacing(0, 10);
		
		// Header
		var header = body.add_container();
		header.set_minimum_size(0, 75);
		header.set_expand_flags(GROG_EXPAND_FILL_X);
		{
			var panel = header.add_panel_container(grogdemo_panel_round);
			panel.set_minimum_size(300, 0);
			panel.set_expand_flags(GROG_EXPAND_FILL_Y);
			
			// Label
			panel.add_label("Ability").set_expand_flags(GROG_EXPAND_BOTH);
		}
		
		// Subheader
		var subheader = body.add_list_container(GROG_HORIZONTAL);
		subheader.set_minimum_size(0, 150);
		subheader.set_expand_flags(GROG_EXPAND_FILL_X);
		subheader.set_item_padding(10);
		{
			// Player
			var panel = subheader.add_panel_container(grogdemo_panel_fancy)
			panel.set_expand_flags(GROG_EXPAND_FILL_BOTH);
			panel.set_margins(0, 8, 0, 0);
			
			var panel_list = panel.add_list_container(GROG_HORIZONTAL);
			panel_list.set_expand_flags(GROG_EXPAND_FILL_BOTH);
			panel_list.add_spacing(38, 0);
			
			var portrait = panel_list.add_panel_container(grogdemo_portrait)
				.set_minimum_size(96, 130)
				.set_expand_flags(GROG_EXPAND_Y);
		}
		{
			// Info
			var panel = subheader.add_panel_container(grogdemo_panel_round);
			panel.set_minimum_size(320, 0);
			panel.set_expand_flags(GROG_EXPAND_FILL_Y);
		}
		
		// Abilities
		var ability_panel = body.add_panel_container(grogdemo_panel_fancy);
		ability_panel.set_expand_flags(GROG_EXPAND_FILL_BOTH);
		ability_panel.set_margins(2, 7, 2, 0);
		
		var ability_container = ability_panel.add_scroll_container();
		ability_container.set_expand_flags(GROG_EXPAND_FILL_BOTH);
		{
			var grid = ability_container.add_grid_container(2);
			grid.set_expand_flags(GROG_EXPAND_FILL_BOTH);
			
			// Grid items
			for (var i = 0; i < array_length(abilities); i++) {
				var ability = grid.add_element(new GrogDemoAbilityButton(abilities[i]))
					.set_minimum_size(0, 64)
					.set_expand_flags(GROG_EXPAND_FILL_BOTH)
					.set_font(grogdemo_font_small);
			}
		}
	}
	#endregion
	// =============================================
	#region Footer
	{
		var panel = list.add_panel_container(grogdemo_panel_fancy);
		panel.set_minimum_size(0, 90);
		panel.set_expand_flags(GROG_EXPAND_FILL_X);
		
		// Buttons
		var button_list = panel.add_list_container(GROG_HORIZONTAL);
		button_list.set_expand_flags(GROG_EXPAND_X | GROG_EXPAND_FILL_Y);
		button_list.set_item_padding(0);
		button_list.set_margins(0, 10, 0, 0);
		{
			// Use
			button_list.add_button("Use", grogdemo_panel_button)
				.set_minimum_size(190, 0)
				.set_expand_flags(GROG_EXPAND_FILL_Y);
			
			// Equip
			button_list.add_button("Equip", grogdemo_panel_button)
				.set_minimum_size(190, 0)
				.set_expand_flags(GROG_EXPAND_FILL_Y);
		}
	}
	#endregion
	// =============================================
	
}

#endregion
// ==============================================

// Init
open_ability_menu();
