<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="CatID" match="Products/Product" use="CategoryID"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">

	<script id="jsPromo" type="text/javascript" language="javascript">		
			<xsl:comment>
				<![CDATA[
					function InsertPromo(DepartmentID, BrandName, ProductDescription, ProductCode, Quantity, DisplaySize, RegularPrice, CurrentPrice, SavingsAmount, SavingsStatement,AdCode)    {
						top.clickThru('%c',DepartmentID, BrandName, ProductDescription, ProductCode, Quantity, DisplaySize, RegularPrice, CurrentPrice, SavingsAmount, SavingsStatement,AdCode);
					}
				]]>
			</xsl:comment>
		</script>

		<style type="text/css">
			#PromotionContainer 			{font-family:Verdana,Arial,sans-serif;color:#000;font-size:12px;width:590px;clear:left;}
			#PromotionContainer h1,h2		{font-size:14px;margin-left:1em;}
			#PromotionContainer h2			{color:#FF0000;clear:left;border:none;}
			#PromotionContainer td a 		{display:block;text-decoration:none; color:#FFFFFF; background:transparent url(/Assets/Common/Images/submit_button_small.gif) no-repeat top left; width:34px; height:16px;font-size:10px;}
			#StepsList ul					{list-style-type:none;margin:0;}
			#PromotionContainer small		{vertical-align:top;font-size:.7em;}
			
			#TextDiv						{border-bottom-style:solid;border-color:#CCC;border-width:3px;}
			#TextDiv img 					{margin:1em;}
			#TextDiv p 						{margin:0 0 0 2em;}
			#TextDiv p.disclaimer			{font-size:10px;margin:2em 0 2em 2em;}
			
			#ProductList img 				{float:left;}
			#ProductList table				{width:400px;margin:0 0 20px 0;}
			#ProductList td					{padding:0;height:2em;font-size:10px;font-weight:bolder;}
		
			.addItem 						{margin-left:5px;}
			div.items						{float:left;clear:both;width:100%;}
			div.items table					{width:100%; margin-left:2em;}
			div.items tr					{height:2em; vertical-align:middle;}
			#PromotionContainer div.items h2					{border-bottom:3px solid #CCCCCC;margin-left:2em;}
			.style1 						{background-color:#EEE;}
			
			td.add							{width:20%;}
			td.product						{width:80%;}
			.productDescription 			{margin:0 0 0 12px;}

			div#ProductList 				{clear:both;}
		</style>
<div id="Sizer" style="VISIBILITY: hidden; WIDTH: 100%; POSITION: absolute; HEIGHT: 100%"></div>
<div id="PromotionContainer">
<div id="TextDiv">
<h1>Lose up to 6 lbs in 2 weeks*<br/>with the new Special K Challenge<small>TM</small>
<img>
<xsl:attribute name="src">/Assets/Common/Images//specialk/specialkfamilyshot_small.jpg</xsl:attribute>
</img>
</h1>
<h2>New Choices Help You Manage Your Weight-Loss Goals</h2>
<p>Lose 6 pounds in 2 weeks* with delicious choices from Kellogg`s<small>&#174;</small> Special K products. The Special K Challenge<small>TM</small> can help you finally keep your resolution to lose weight.</p>
<h2>Discover the Steps to Success</h2>
<ul id="StepsList">
<li><b>Step 1: </b>Kick-start your day with a serving of your favorite Special K cereal (any variety) with 2/3 cup skim milk or a serving of Special K<small>&#174;</small> waffles drizzled with 2 tbsp. of lite syrup. Enjoy either option with fruit.</li><br />
<li><b>Step 2: </b>Replace another meal with one of the delicious new Special K<small>TM</small> Protein Meal Bars or choose another serving of your favorite Special K<small>&#174;</small> cereal.</li><br />
<li><b>Step 3: </b>Eat your third meal as you normally do.</li><br />
<li><b>Step 4: </b>Enjoy two great-tasting snacks throughout your day from an assortment of Special K options. Choose Special K<small>TM</small> Protein Snack Bars, Special K2O<small>&#174;</small> Protein Water, Special K2O<small>TM</small> Protein Water Mix, Special K<small>&#174;</small> Bars or deliciously filling Special K<small>TM</small> Snack Bites. Consume fruits and vegetables for additional snacks.</li><br />
</ul>
<h2>Stay on the Move</h2>
<p>Behind every successful weight management program is a good workout routine. Make sure your schedule includes walking, yoga, an aerobics class or any of your favorite activities to keep the momentum going.</p>
<h2>Taste Success</h2>
<p>With all this variety, see how easy it is to drop up to a jean size in 2 weeks.* It works!</p>
<p class="disclaimer">*Consult your physician before starting any diet or exercise program. Average weight loss when replacing meals with two cereal meals is five pounds. Weight loss may vary.<br/><br/> <small>TM</small>, Copyright 2008 Kellogg NA Co.</p>
<b>Choose from the items listed below.</b>
</div>
<div id="productList">
<xsl:for-each select="Products/Categories/Category">
<xsl:sort select="Name"/>
<div class="items">
<img>
	<xsl:attribute name="src"><xsl:value-of select="CategoryIMG"/></xsl:attribute>
</img>
<h2><xsl:value-of select="Name"/></h2>
<xsl:call-template name="ListDetail">
	<xsl:with-param name="ListCatID" select="CategoryID"/>
</xsl:call-template>
<br/>
</div>
</xsl:for-each>
</div>
</div>
<script language="javascript">
	var gridDiv = document.getElementById("mainBody");
	//window.onresize = resizeDisplay; messes with alttxt.js
	//window.onload = resizeDisplay;
	setInterval('resizeDisplay()', 3000);
	
	function resizeDisplay() {
		var tmpHeight, tmpWidth;
		tmpWidth = document.body.clientWidth;
		tmpHeight = document.body.clientHeight-130;
		
		
		if (tmpHeight &#60; 100) { 
			tmpHeight=100; 
		}
		if (gridDiv != null){
			gridDiv.style.height = tmpHeight;	
		}		
	}
</script>	
<style type="text/css">
/* hide the scrollbars since form pushes page down too far */
body {
	/*background-color: #CEE7A3; */
	scrollbar-shadow-color: #ffffff;
	scrollbar-highlight-color: #ffffff;
	scrollbar-face-color: #ffffff;
	scrollbar-3dlight-color: #ffffff;
	scrollbar-darkshadow-color: #ffffff;
	scrollbar-track-color: #ffffff;
	scrollbar-arrow-color: #ffffff;
}

</style>
</xsl:template>

<xsl:template name="ListDetail" match="Products/Product">
		<xsl:param name="ListCatID"/>
		
		<table cellspacing="0px" cellpadding="0px" border="0px">
		<xsl:for-each select="key('CatID',  $ListCatID)">
			<xsl:sort select="ProductDescription"/>
			

			<tr>
			<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2">style1</xsl:when><xsl:otherwise>style2</xsl:otherwise></xsl:choose></xsl:attribute>
			<td class="add">
			<a href="#" >
				<xsl:attribute name="onclick">javascript:InsertPromo('<xsl:value-of select="DepartmentID"/>','<xsl:value-of select="BrandName"/>','<xsl:value-of select="ProductDescription"/>','<xsl:value-of select="ProductCode"/>','<xsl:value-of select="Quantity"/>','<xsl:value-of select="DisplaySize"/>','<xsl:value-of select="RegularPrice"/>','<xsl:value-of select="CurrentPrice"/>','<xsl:value-of select="SavingsAmount"/>','<xsl:value-of select="SavingsStatement"/>','<xsl:value-of select="AdCode"/>');</xsl:attribute>
				<!--<xsl:attribute name="onclick">javascript:InsertPromo('<xsl:value-of select="ProductDescription"/>','<xsl:value-of select="UPC"/>');</xsl:attribute> -->
					<span class="addItem">ADD</span>
				</a></td>
			<td class="product">
				<span class="productDescription"><xsl:value-of select="BrandName"/><text> </text>
				<xsl:value-of select="ProductDescription"/></span>
			</td>
			</tr>
		</xsl:for-each>
		</table>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="12.18.07" userelativepaths="yes" externalpreview="no" url="products.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="products.xml" srcSchemaRoot="Products" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="xsl:for-each" x="354" y="0"/><block path="xsl:for-each/xsl:call-template" x="304" y="0"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->