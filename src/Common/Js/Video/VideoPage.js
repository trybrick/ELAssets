
function updateCurrentTitle(title) {
	$('CurrentVideoTitle').innerHTML = title;
}

function updateCurrentCategory(title) {
	$('CurrentCategory').innerHTML = title;
}

function switchDivs(showDiv,hideDiv) {
	$(showDiv).show();
	$(hideDiv).hide();
}

function setActiveTab(tabid,tabPageID) {
	var tabClassName = 'a.videoTab';
	var allTabs = $$(tabClassName);
	allTabs.each(function(elem){
		elem.removeClassName('current');	
	});
	$(tabid).addClassName('current');
	
	var divClassName = 'div.videoTabPage';
	var allDivs = $$(divClassName);
	allDivs.each(function(elem){
		elem.hide();				  
	});
	$(tabPageID).show();
}

function loadVideo(videoID,title,pubsite_id,pr_id) {
	var source = "http://groceryshopping.jambocast.com/tower.php?pubsite_id="+pubsite_id+"&pr="+pr_id+"&vcs_id="+videoID;
	$('VideoPlayerTarget').src = source;
	updateCurrentTitle(title);
}

function ResetScrollPos() {			
	$('PlayListTarget').scrollTop = 0;
}