var inputCounter = -1;
var submitted = false;

function UpdateFakeInput() {
	var targetValue = $('recipeImage').getValue();
	$('fakeFileUpload').value = targetValue;
}

function DeleteElement(element) {
	
	if (element == null || typeof(element) == 'undefined') {
		return;
	}

	var parent = element.parentNode;

	if (parent == null) {
		return;
	}

	var grandParent = parent.parentNode;

	if (grandParent != null) {
		grandParent.removeChild(parent);
	}
}

function AddNewRecipeInput(inputid) {
	var elementID = '';
	var inputKeyWord = '';
	var inputTitle = '';

	switch(inputid) {
		case 1:
			elementID = 'OwnRecipeIngredients';
			inputKeyWord = 'ingredient';
			inputTitle = ingredientTitle;
			break;
		case 2:
			elementID = 'OwnRecipeInstructions';
			inputKeyWord = 'instruction';
			inputTitle = instructionTitle;
			break;
		case 3:
			elementID = 'OwnRecipeNotes';
			inputKeyWord = 'note';
			inputTitle = noteKeyWord;
			break;
		default:
			return;
	}
	
	
	
	if (inputCounter < 1) {
		inputCounter = $$('input').length;
	}				

	inputCounter += 1;

	var inputName = inputKeyWord + ':' + inputCounter;
	
	$(elementID).appendChild(CreateInput(inputName , '', inputTitle, inputid));	

	var inputObj = $(inputName);
	if(inputObj != null){
		inputObj.focus();
	}
}

function CreateInput(name, value, title, inputid) {

	var newInput = inputTemplate;
	var wrapper = document.createElement('div');

	newInput = newInput.replace('#name#', name);
	newInput = newInput.replace('#value#', value);
	newInput = newInput.replace('#title#', title);
	newInput = newInput.replace('#inputid#', inputid);
	newInput = newInput.replace('#elementid#', name);

	wrapper.innerHTML = newInput;
	return wrapper.firstChild;
}

function SaveRecipe() {
	
	if ($('RecipeTitle').value == '') {
		$('RecipeTitleInvalid').show();
		$('ViewButton').display = 'none';
	}
	else {
		$('RecipeTitleInvalid').hide();
		document.forms[0].submit();
	}
}

function UpdateRecipeImage2(event) {
	var txtValue = event.findElement('input').value;
	var recipeImage2 = $('recipeImage2');
	alert('txtValue');
	if(txtValue != '') {
		recipeImage2.value = txtValue;
	}
}