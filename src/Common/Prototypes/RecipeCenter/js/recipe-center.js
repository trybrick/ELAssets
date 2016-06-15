// selector ids
var primaryContentNavigation = 'primary-content-navigation';
var primaryContentModule = '#primary-content .section';

var defaultAdvancedKeyword = 'Recipe title or ingredient to search for.';
var defaultAdvancedExclude = 'Ingredients or words to exclude from search results.';

// only show js interactive elements if user has js enabled browser. Unobstrusive dom scripting.
function InitializeAdvancedSearch() {
	AttachToggleListeners('toggle-advanced-link');
	$('toggle-advanced-link').show();
	$('adv-search-exclude').writeAttribute('value',defaultAdvancedExclude);
	$('adv-search-term').writeAttribute('value', defaultAdvancedKeyword);
}

function InitializePrimaryContentNav() {
	AttachTabListeners();
	
	var primaryContentModules = $$(primaryContentModule);
	for(var i = 0; i < primaryContentModules.length; i++) {
		if(i > 0) {
			$(primaryContentModules[i]).hide();
		}
	}
	
	$(primaryContentNavigation).show();
	// set active tab to first
	var currentActive = $(primaryContentNavigation).firstDescendant();
	$(currentActive).addClassName('active');
}

function InitializeRelatedContent() {
	AttachPagerListeners();
	
	// Set style on pager control on page load so this only affects JS enabled users
	var relatedWrappers = $$('.related-wrapper');
	for(var i = 0; i < relatedWrappers.length; i++){
		var relatedInner = $(relatedWrappers[i]).firstDescendant();
		$(relatedInner).addClassName('related-inner');	
	}
	
	// Set up pager interactions. initialize pager links.
	var relatedPagers = $$(primaryContentModule + ' .related-pager');
	for(var i = 0; i < relatedPagers.length; i++) {
		$(relatedPagers[i]).show();
		// Set the first link of each pager control to 'active'
		var firstChild = $(relatedPagers[i]).firstDescendant();
		$(firstChild).addClassName('current-page');	
	}	
}

// add expand/contract listeners
function AttachToggleListeners(toggleID) {
	try {
		$(toggleID).observe('click',function(event){
			var overlay = $('advanced-search');
			var action = 'expand';
			if(overlay){
				if($(overlay).hasClassName('expanded')){
					action = 'collapse'
				} else {
					action = 'expand';
				}
			
				ToggleOverlay(overlay,action);
			}
		});
	}
	
	catch(ex) {
		//exception
	}
}

// set expand/contract state. This could have been included in the AttachQuickSarchListener function but I chose to keep distinct functions separate.
function ToggleOverlay(element,action) {
	if(action == 'expand') {
		Effect.BlindDown(element, { duration: 1.0 });
		$('toggle-advanced-link').innerHTML = "Basic Search";
		Effect.BlindUp('top-search-control',{ duration: 1.0 });
		$(element).addClassName('expanded');
	}
		
	else if(action == 'collapse') {
		Effect.BlindUp(element, { duration: 1.0 });
		$('toggle-advanced-link').innerHTML = "Advanced Search";
		Effect.BlindDown('top-search-control',{ duration: 1.0 });
		$(element).removeClassName('expanded');
	}
}

// attach mouse event handlers for tab links
function AttachTabListeners() {
	var tabLinks = $$('#' + primaryContentNavigation + ' li a');
	for(var i = 0; i < tabLinks.length; i++) {
		$(tabLinks[i]).observe('click',function(event){
			var element = Event.element(event);
			// title attribute has to match target content div id
			var elemId = $(element).readAttribute('title');
			ShowOneTab(elemId);
		});
	}
}

// show the selected tab after hiding all others
function ShowOneTab(elemId) {
	HideAllTabs();
	var activeTab = $$('#' + primaryContentNavigation + ' li a[title="'+elemId+'"]');
	if(activeTab.length > 0){
		$(activeTab[0]).up('li').addClassName('active');
	}
	$(elemId).show();
}

function HideAllTabs() {
	// turn off active tab style
	var tabItems = $$('#' + primaryContentNavigation + ' li');
	for(var i = 0; i < tabItems.length; i++) {
		$(tabItems[i]).removeClassName('active');
	}
	// hide all tabs
	var contentModules = $$(primaryContentModule);
	for(var i = 0; i < contentModules.length; i++) {
		contentModules[i].hide();
	}
}

// attaches mouse events to pager links
function AttachPagerListeners() {
	var pagers = $$(primaryContentModule + ' .related-pager .pager-button');
	for(var i = 0; i < pagers.length; i++) {
		$(pagers[i]).observe('click',function(event){
			var element = Event.element(event);
			var pageNum = element.innerHTML; // link text content must include page number.
			if(pageNum != ""){
				SetPage(element,pageNum);
			}
		});
	}
}

// this function slides the active tab's related content modules.
function SetPage(element,pageNum) {
	SetActivePagerStyle(element);
	
	// walk up the dom tree to the related-content container div. Loop exits in case class is not defined.
	while(!$(element).hasClassName('related-content') || !$(element).up() ) {
		 element = $(element).up();
	}
	
	// calculate horizontal offset parameter using module width
	var loffset = $(element).getStyle('width');
	loffset = parseInt(loffset) * (parseInt(pageNum)-1) * -1;
	// get content type to target specific element
	var contentType = $(element).readAttribute('title');
	var elementId = contentType+"-"+pageNum;
	element = $(elementId).up('.related-inner');
	if(element != undefined) {
		// slide selected module into view
		new Effect.Move(element,{x:loffset, y:0, mode:'absolute'});
	}
}

// sets a "you are here" class on clicked page link
function SetActivePagerStyle(element) {
	var parentId = $(element).up('.related-pager').readAttribute('id');
	if(parentId){
		var pagers = $$('#'+ parentId +' .pager-button');
		for(var i = 0; i < pagers.length;i++){
			if(($(pagers[i]).readAttribute('title')) == ($(element).readAttribute('title'))) {
				$(element).addClassName('current-page');
			} else {
				if($(pagers[i]).hasClassName('current-page'))
					$(pagers[i]).removeClassName('current-page');
			}
		}
	}
}

function advancedSearchFocus(inputElement) {
	$(inputElement).writeAttribute('value','');
	$(inputElement).removeClassName('default-value');
}