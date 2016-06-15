<?xml version="1.0" encoding="UTF-8"?><!-- DWXMLSource="GreenGiant.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
<style>
	#AdDisplayDivMaster			{display:none;}
	#GgContainerDiv				{width: 600px;overflow: hidden;margin:0 auto;font-size:14px;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;}
	#GgIntroDiv					{width: 75%;}
	#GgIntroDiv p				{width: 90%;}
	#GgHeaderDiv				{width: 100%;height: 110px;text-indent: -9999px;background: transparent url(/Assets/Common/Promotions/GreenGiant/Images/GreenGiantHeader.png) no-repeat top left;}
	#GgHeading2					{border:none;width: 100%;font-size:20px;}
	
	div.GgProductDiv			{width: 100%;margin-bottom:25px;padding-bottom:25px;border-bottom:2px solid #A0A0A0;}
	table.GgProductTable		{width: 100%;}
	td.GgProductDescription	p	{width: 350px;}

	h3.GgHeading				{font-size: 18px;font-style: italic;font-weight: bold;color: #005D3A;}
	
	#varieties					{display: block;font-weight: bold;border-bottom: 2px solid #A0A0A0;margin-bottom: 25px;width: 600px;}
	
	td.GgProductDescription a:link,
	td.GgProductDescription a:visited,
	td.GgProductDescription a:hover,
	td.GgProductDescription a:active	{color:#FFFFFF;text-decoration:none;}
	
	a.GgAddButton				{padding-top: 3px;text-align: center;text-decoration: none; display: block;width: 119px; height: 24px; color: #FFFFFF;background: transparent url(/Assets/Common/Promotions/GreenGiant/Images/GgButton.png) no-repeat top left;}

</style>
<script type="text/javascript">
	<![CDATA[
	var axel = Math.random() + "";
    var ord = axel * 1000000000000000000; 
  
    function countClick(click)
    {
        var obj = document.getElementById('pixel');
		if (obj != null)
		{
			if(click != '%c')
			{
				var clkad = click + '/Assets/Common/Images/pixel.gif?rn='  + ord;
				if(obj.location){
					obj.location.replace(clkad);
				} else if(obj.src) {
					obj.src = clkad;
				}	 
				var clkad = '';
			}
		}
    }
  
    function clickThru(click, DepartmentID, BrandName, ProductDescription, ProductCode, Quantity, DisplaySize, RegularPrice, CurrentPrice, SavingsAmount, SavingsStatement, AdCode){
        //var clkad = click + '/Assets/Common/Images/pixel.gif?rn=' + ord;
        //top.frames['pixel'].location.replace(clkad);
        //var clkad = '';
		countClick(click);
		
        var QueryString = new String('');
        QueryString += buildQueryString('DepartmentID', DepartmentID);
        QueryString += '~';
        QueryString += buildQueryString('BrandName', BrandName);
        QueryString += '~';
        QueryString += buildQueryString('ProductDescription', ProductDescription);
        QueryString += '~';
        QueryString += buildQueryString('ProductCode', ProductCode);
        QueryString += '~';
        QueryString += buildQueryString('DisplaySize', DisplaySize);
        QueryString += '~';
        QueryString += buildQueryString('RegularPrice', RegularPrice);
        QueryString += '~';
        QueryString += buildQueryString('CurrentPrice', CurrentPrice);
        QueryString += '~';
        QueryString += buildQueryString('SavingsAmount', SavingsAmount);
        QueryString += '~';
        QueryString += buildQueryString('SavingsStatement', SavingsStatement);
        QueryString += '~';
        QueryString += buildQueryString('Quantity', Quantity);
        QueryString += '~';
        QueryString += buildQueryString('AdCode', AdCode);
        //alert(QueryString);
        //__doPostBack('Ad', QueryString)
        AddAdToShoppingList(QueryString);
        //if(QueryString.length > 0){
        //  window.location = 'ShoppingListEditPage.aspx' + QueryString;
        // }
    }
   
    function buildQueryString(KeyWord, KeyValue){
        if (KeyValue != null){
          KeyValue = new String(KeyValue);  
          KeyValue = KeyValue.replace(/&/, '`');  
          return KeyWord + '=' + KeyValue.toString();
        }else{
          return '';
        }
      }
	]]>
</script>
<div id="GgContainerDiv">
	<div id="GgHeaderDiv">
		<h1 id="GgHeading1">Green Giant</h1>
    </div>
    <div id="GgIntroDiv">
		<div style="width:600px;"><a id="backLink" style="display:block;width:200px;text-decoration:underline;" href="##root##/Shop/WeeklyAd.aspx">Back to Weekly Ad</a></div>
    	<h2 id="GgHeading2">Green Giant Healthy Blends</h2>
        <h3 class="GgHeading">Healthy Weight, Immunity Boost, and Healthy Vision</h3>
        <p>Now Green Giant offers you a delicious way to meet your health goals - <em>Healthy Weight</em>, <em>Immunity Boost</em>, and <em>Healthy Vision</em>.  Each is a variety of premium all natural vegetables uniquely blended and lightly tossed with a great tasting sauce to provide you with specific nutrients to help you feel your best:</p>
        <span id="varieties">Varieties:</span>
    </div>
    <div id="GgMainDiv">
    	<xsl:for-each select="GreenGiant/Products/Product">
        	<div class="GgProductDiv">
            <table class="GgProductTable">
               	<tr>
                	<td class="GgImageDiv">
                		<img>
                    		<xsl:attribute name="src">/Assets/Common/Promotions/GreenGiant/Images/<xsl:value-of select="Image" /></xsl:attribute>
                    	</img>
                	</td>
                	<td class="GgProductDescription">
                		<p><strong><xsl:value-of select="Name" /></strong> - <xsl:value-of select="Description" /></p>
                    	<p>- <xsl:value-of select="Ingredients" /></p>
                        <a class="GgAddButton" href="#">
                        <xsl:attribute name="onclick">clickThru('<xsl:value-of select="Params/click" />','<xsl:value-of select="Params/DepartmentID" />','<xsl:value-of select="Params/BrandName" />','<xsl:value-of select="Params/ProductDescription" />','<xsl:value-of select="Params/ProductCode" />','<xsl:value-of select="Params/Quantity" />','<xsl:value-of select="Params/DisplaySize" />','<xsl:value-of select="Params/RegularPrice" />','<xsl:value-of select="Params/CurrentPrice" />','<xsl:value-of select="Params/SavingsAmount" />','<xsl:value-of select="Params/SavingsStatement" />','<xsl:value-of select="Params/AdCode" />');</xsl:attribute>
                        Add To List ></a>
                	</td>
                  </tr>
            </table>
            </div>
        </xsl:for-each>
    </div>
</div>

</xsl:template>
</xsl:stylesheet>