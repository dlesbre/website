const storage = localStorage;
const theme_key = "theme";
const theme_light = "light";

function get_current_theme() {
	console.log(storage);
	const theme = storage.getItem(theme_key);
	if (theme == theme_light)
		return false;
	return true;
}

function toggle_theme() {
	var theme = !get_current_theme();
	set_theme(theme);
}

function set_theme(dark) {
	const theme_class = "light-theme";
	if (dark) {
		document.body.classList.remove(theme_class);
		storage.removeItem(theme_key);
	}
	else {
		document.body.classList.add(theme_class);
		storage.setItem(theme_key, theme_light);
	}
	console.log(storage);
}

document.addEventListener('DOMContentLoaded', function () {
	set_theme(get_current_theme());
});
