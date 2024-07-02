const profile = {

	/**
	*사이트 contextPath 조회
	*/
	getRootUrl() {
		const rootUrl = document.querySelector("meta[name='rootUrl']").content;

		return rootUrl;
	},

/**
* 무작위 포켓몬 조회
*/
	random() {
		const rootUrl = profile.getrootUrl();
		const apiUrl = `${rootUrl}api/pokemon/random`;
		fetch(apiUrl)
			.then((res) => res.json())
			.then(data => {
				if(typeof callbackProfile == 'function') {
					callbackProfile(data);
				}
			});
	}
};

window.addEventListener("DomContentLoaded", function() {
	const el = document.getElementById("generate-profile-image");
	if (el) {
		el.addEventListener("click", profile.random);
	}
});