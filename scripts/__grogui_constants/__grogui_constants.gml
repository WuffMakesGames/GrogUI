
#macro __GROG_UI_TITLE "GrogUI"
#macro __GROG_UI_VERSION "v1.0a"
#macro __GROG_UI_DEBUG_TITLE ($"{__GROG_UI_TITLE} ({__GROG_UI_VERSION})")

// Sprite stretch flags
#macro GROG_STRETCH_IGNORE 0 // Retain it's original size, regardless of the element size
#macro GROG_STRETCH_CENTER 1 // Center the image in the element

#macro GROG_STRETCH_FILL 10 // Stretch the image to fill the element

#macro GROG_STRETCH_FIT_HORIZONTAL 20 // 
#macro GROG_STRETCH_FIT_VERTICAL 21

// Directions flags
#macro GROG_VERTICAL 0
#macro GROG_HORIZONTAL 1

// Sort orders
// i.e Left to Right/Top to Bottom
#macro GROG_SORT_BEGINING 0 // Left to right
#macro GROG_SORT_CENTER 1	// Left to right (But centered)
#macro GROG_SORT_END 2		// Right to left

// Doesn't expand at all
#macro GROG_EXPAND_NONE 0

// Expands in a container without changing its size
// i.e. Center an element like text, while the text itself remains aligned to the left
#macro GROG_EXPAND_X 1 // Expands in the x axis
#macro GROG_EXPAND_Y 2 // Expands in the y axis
#macro GROG_EXPAND_BOTH (GROG_EXPAND_X | GROG_EXPAND_Y) // Expands in both axis

// Grows to fill the container
// i.e. Make a panel fill the container it is inside of
#macro GROG_EXPAND_FILL_X 4 // Grows in the x axis
#macro GROG_EXPAND_FILL_Y 8 // Grows in the y axis
#macro GROG_EXPAND_FILL_BOTH (GROG_EXPAND_FILL_X | GROG_EXPAND_FILL_Y) // Grows in both axis
