const sliders = document.querySelector(".carouselbox")
var scrollPerClick;
varImagePadding = 20;
console.log("THE JS IS WORKING ")

movieData();

var scrollAmount = 0;
function sliderScrollLeft() {
	sliders.scrollTo({
		top: 0,
		left: (scrollAmount -= scrollPerClick),
		behavior: "smooth",
	});
	if (scrollAmount < 0) {
		scrollAmount = 0;
	}
}
function sliderScrollRight() {
	if (scrollAmount <= sliders.scrollWidth - sliders.clientWidth) {
		sliders.scrollTo({
			top: 0,
			left: (scrollAmount += scrollPerClick),
			behavior: "smooth",
		});
	}
}

async function movieData() {
	const api_key = "19011a9abd3cbc1c18f64f1e5a0c350b"
	
	var result = await axios.get(
		"http://api.themoviedb.org/3/discover/movie?api_key=" + api_key + "&sort_by=popularity.desc"
	);
	console.log(result.data.results);
	result = result.data.results;
	
	result.map(function (cur, index) {
		sliders.insertAdjecentHTML(
		"beforeend", 
		`<img class="img-${index} slider-img" src="https://image.tmdb.org/t/p/w185/${cur.poster_pat}" />`
		)
	})
	scrollPerClick = document.querySelector(".img-1").clientWidth + ImagePadding;
}