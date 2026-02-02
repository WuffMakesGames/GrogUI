
// Enables drawing container bounds
#macro GROG_DEBUG true

// List sort directions
#macro GROG_VERTICAL 0
#macro GROG_HORIZONTAL 1

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
