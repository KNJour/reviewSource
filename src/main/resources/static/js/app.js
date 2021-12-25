const arrows = document.querySelectorAll(".arrow");
const reviewLists = document.querySelectorAll(".review-list");

for (var i = 0; i <= arrows.length - 1; i++) {
	console.log(arrows[i]);
	arrows[i].addEventListener("click", ()=>{
		console.log("you clicked " + i + arrows[i]);
	})
}

arrows.forEach((arrow, i) => {
		const listLength = reviewLists[i].querySelectorAll("img").length;
		let clicks = 0;
	arrow.addEventListener("click", () => {
		clicks++;
		if(listLength - (5+clicks) > 0) {
				reviewLists[i].style.transform = `translateX(${
			reviewLists[i].computedStyleMap().get("transform")[0].x.value
		-520}px)`;
		}
		else {
			reviewLists[i].style.transform = "translateX(0)";
			clicks = 0;
		}
	})
	console.log(reviewLists[i].querySelectorAll("img").length);
})

