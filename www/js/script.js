var is_dark = true;

function toggle_theme() {
	var button = document.getElementsByClassName("themetoggle");
	document.body.classList.toggle("light-theme");
	is_dark = !is_dark;
	button.title = is_dark ? "Thème clair" : "Thème sombre";
	console.log("toggle");
	console.log(is_dark);
	console.log(button.title);
	console.log(is_dark ? "Thème clair" : "Thème sombre");
}