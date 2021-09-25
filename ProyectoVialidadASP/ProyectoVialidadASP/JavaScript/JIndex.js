window.addEventListener('scroll', function () {
	var header = document.querySelector('header');
	header.classList.toggle('sticky', window.scrollY > 0);
});
function noscroll() {
	window.scrollTo(0, 0);
}
var aux = 1;
function toggleMenu() {
	var menuToggle = document.querySelector('.toggle');
	var menu = document.querySelector('.menu');
	menuToggle.classList.toggle('activate');
	menu.classList.toggle('activate');
	if (aux == 1) {
		window.addEventListener("scroll", noscroll);
		aux = 2;
	} else {
		window.removeEventListener("scroll", noscroll);
		aux = 1;
	}
	console.wri
}