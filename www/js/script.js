// @ts-check
// ==================================================
// Light/Dark theme
// ==================================================

const STORAGE = sessionStorage;
// Key used to store theme in local storage
const THEME_KEY = "theme";
// Class to add to html body to switch themes (defined in the CSS)
const THEME_CLASS = "light-theme";

// Possible themes
const THEME_ENUM = {
	Light: "light",
	Dark : "dark",
};

// Get the theme in local storage
// If not present, return the default (dark) theme
function get_current_theme() {
	const theme = STORAGE.getItem(THEME_KEY);
	if (theme == THEME_ENUM.Light)
		return THEME_ENUM.Light;
	return THEME_ENUM.Dark; // default theme
}

// Called when clicking the toggle button
function toggle_theme() {
	const theme = get_current_theme();
	if (theme == THEME_ENUM.Light)
		set_theme(THEME_ENUM.Dark);
	else
		set_theme(THEME_ENUM.Light);
}

// Set the them to the given value
function set_theme(theme) {
	const html = document.documentElement;
	if (theme == THEME_ENUM.Dark) {
		// Remove THEME_CLASS from html body for default theme
		// Also remove it from local storage
		html.classList.remove(THEME_CLASS);
		STORAGE.removeItem(THEME_KEY);
	}
	else {
		html.classList.add(THEME_CLASS);
		STORAGE.setItem(THEME_KEY, THEME_ENUM.Light);
	}
}

// ==================================================
// Callapsible sections
// ==================================================

function setup_collapsibles() {
	const collapsibles = document.getElementsByClassName("collapsible");

	for (const collapsible of collapsibles) {
		// Get the content (next alement)
		const content = collapsible.nextElementSibling;
		if (content === null) continue;

		// Add toggle on click
		collapsible.addEventListener("click", function() {
			content.classList.toggle("folded");
		});
	}
}

// ==================================================
// Setup everything once the document loads
// ==================================================


window.onload = function () {
	set_theme(get_current_theme());
	setup_collapsibles();
}
