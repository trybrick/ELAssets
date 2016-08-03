<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<script type="text/javascript"><![CDATA[
			
			function AskTheChef() {
				
				if (CheckEmailAddress() & CheckQuestion()) {
					document.forms[0].submit();
				}
			}

			function CheckEmailAddress() {
				
				var emailValidator = new RegExp("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$"); 
				
				var isValid = emailValidator.test($('txtEmail').value);

				if (!isValid) {
					$('txtEmail').className = 'Invalid';
					$('fvEmail').show();
				}
				else {
					$('txtEmail').className = '';
					$('fvEmail').hide();
				}

				return isValid;
			}

			function CheckQuestion() {
				
				var isValid = $('txtQuestion').value != '';

				if (isValid) {
					$('txtQuestion').className = '';
					$('fvQuestion').hide();
				}
				else {
					$('txtQuestion').className = 'Invalid';
					$('fvQuestion').show();
				}

				return isValid;
			}
		]]>
		</script>
		<div id="Article">
			<div id="SubmitAskChefControl">
				<h2>Ask The Chef</h2>
				<div>
					<h3>Enter your question and click the submit button.</h3>
					<div class="clear">
						<span class="askChef">Email Address:</span>
						<input type="text" id="txtEmail" name="EmailFrom" onkeydown="javascript:if (event.keyCode==13) AskTheChef(); return event.keyCode!=13;" />
						<span id="fvEmail" style="display:none;">Please enter a valid email address.</span>
					</div>
					<div class="clear">
						<span class="askChef">Question:</span>
						<textarea id="txtQuestion" cols="50" rows="4" name="Question" onkeydown="javascript:if (event.keyCode==13) AskTheChef(); return event.keyCode!=13;"></textarea>
						<span id="fvQuestion" style="display:none;">Please enter a question.</span>
					</div>
					<div class="clearfix submitButtons">
						<a href="javascript:AskTheChef();" class="button">
							<span>Submit your Question</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div id="BackToArticle" class="clearfix">
			<a href="/Recipes/RecipeCenter.aspx">Back To Recipe Center</a>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->