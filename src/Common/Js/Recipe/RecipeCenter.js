function RunSearch() {
	var queryString = BuildQueryString();
    var location = '/Recipes/Search.aspx';
    location = location + '?' + queryString;

    document.location = location;
}