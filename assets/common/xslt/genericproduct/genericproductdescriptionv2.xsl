<?xml version="1.0"?>
<!-- Used by D'Agostinos and Online Grocery Chains -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="product-description-lightbox">
			<xsl:for-each select="ExpressLane/GenericProductDescription">
				<div class="generic-product-description">
					<div class="ItemName">
						<h2 class="group"><span><xsl:value-of select="concat(GenericProduct/BrandName,' ',GenericProduct/Description,' ',ItemExtendedSize)"/></span><strong class="upc"> UPC: <xsl:value-of select="Upc11"/></strong></h2>
					</div>
					<div class="group">
						<xsl:if test="string-length(LargeImageUrl) &gt; 0">
							<div class="product-large-image">
								<xsl:for-each select="GenericProduct">
									<xsl:call-template name="AddToListControlLightwindow"/>
								</xsl:for-each>
								<img src="{LargeImageUrl}" alt=""/>
							</div>
						</xsl:if>
						<xsl:if test="count(Nutrients/GenericNutrient[number(PctDailyValue) &gt; 0]) &gt; 0">
							<div class="nutrition-facts-wrap">
								<table class="nutrition-facts" cellspacing="0" cellpadding="0">
									<caption>Nutrition Facts</caption>
									<thead>
										<tr>
											<th scope="col" class="amount">Amount per Serving</th>
											<th scope="col" class="percent-daily">% Daily Value*</th>
										</tr>
									</thead>
									<tbody>
										<!-- nutrition order hard coded as requested. See case 15501. -->
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Calories']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Total Fat']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Saturated Fat']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Cholesterol']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Sodium']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Potassium']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Total Carbohydrate']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Dietary Fiber']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Sugars']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Protein']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Vitamin A']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Vitamin C']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Calcium']" />
										</xsl:call-template>
										<xsl:call-template name="NutrientRow">
											<xsl:with-param name="GenericNutrient" select="Nutrients/GenericNutrient[normalize-space(Description)='Iron']" />
										</xsl:call-template>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"><em>*Percent Daily Values are based on a 2,000 calorie diet. Your daily values may be higher or lower depending on your calorie needs.</em></td>
										</tr>
									</tfoot>
								</table>
								<table class="daily-value" cellspacing="0">
								<!-- this table uses microformats to describe data. http://microformats.org/about -->
									<thead>
										<tr class="hmeasure">
											<th scope="row" colspan="2" class="item">Calories</th>
											<th scope="col" class="num">2,000</th>
											<th scope="col" class="num">2,500</th>
										</tr>
									</thead>
									<tbody>
										<tr class="hmeasure">
											<td class="item">Total Fat</td>
											<td>Less than </td>
											<td><span class="num"> 65</span><span class="unit">g</span></td>
											<td><span class="num"> 80</span><span class="unit">g</span></td>
										</tr>
										<tr class="hmeasure">
											<td class="item">Sat. Fat</td>
											<td>Less than </td>
											<td><span class="num"> 20</span><span class="unit">g</span></td>
											<td><span class="num"> 25</span><span class="unit">g</span></td>
										</tr>
										<tr class="hmeasure">
											<td class="item">Cholesterol</td>
											<td>Less than </td>
											<td><span class="num"> 300</span><span class="unit">mg</span></td>
											<td><span class="num"> 300</span><span class="unit">mg</span></td>
										</tr>
										<tr class="hmeasure">
											<td class="item">Sodium</td>
											<td>Less than </td>
											<td><span class="num"> 2400</span><span class="unit">mg</span></td>
											<td><span class="num"> 2400</span><span class="unit">mg</span></td>
										</tr>
										<tr class="hmeasure">
											<td class="item">Potassium</td>
											<td></td>
											<td><span class="num"> 3500</span><span class="unit">mg</span></td>
											<td><span class="num"> 3500</span><span class="unit">mg</span></td>
										</tr>
										<tr class="hmeasure">
											<td class="item">Total Carbohydrate</td>
											<td>Less than</td>
											<td><span class="num"> 300</span><span class="unit">g</span></td>
											<td><span class="num"> 375</span><span class="unit">g</span></td>
										</tr>
										<tr class="hmeasure">
											<td class="item">Dietary Fiber</td>
											<td></td>
											<td><span class="num"> 25</span><span class="unit">g</span></td>
											<td><span class="num"> 30</span><span class="unit">g</span></td>
										</tr>
										<tr class="hmeasure">
											<td class="item">Protein</td>
											<td></td>
											<td><span class="num"> 50</span><span class="unit">g</span></td>
											<td><span class="num"> 65</span><span class="unit">g</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
					</div>
				</div>
				<xsl:if test="string-length(Ingredients) &gt; 0">
					<h2>Ingredients:</h2>
					<xsl:value-of select="Ingredients"/>
				</xsl:if>
				<xsl:if test="string-length(Details) &gt; 0">
					<h2>Details</h2>
					<xsl:value-of select="Details"/>
				</xsl:if>
				<xsl:if test="string-length(Directions) &gt; 0">
					<h2>Directions</h2>
					<xsl:value-of select="Directions"/>
				</xsl:if>
				<xsl:if test="string-length(DrugInteractions) &gt; 0">
					<h2>Drug Interactions</h2>
					<xsl:value-of select="DrugInteractions"/>
				</xsl:if>
				<xsl:if test="string-length(Warnings) &gt; 0">
					<h2>Warnings</h2>
					<xsl:value-of select="Warnings"/>
				</xsl:if>
			</xsl:for-each>
		</div>
	</xsl:template>
	
<!-- ========================================================================================== -->

	<xsl:template name="NutrientRow">
	<xsl:param name="GenericNutrient" />
		<xsl:if test="number($GenericNutrient) &gt; 0">
		<tr class="product-nutrition-info amount">
			<td>
				<strong class="item"><xsl:value-of select="$GenericNutrient/Description" /></strong>
				<xsl:if test="number($GenericNutrient/Amount) &gt; 0">
					<span class="hmeasure"><xsl:value-of select="$GenericNutrient/Amount"/><xsl:value-of select="$GenericNutrient/MeasureUnit"/></span>
				</xsl:if>
			</td>
			<td class="percent-daily">
				<xsl:if test="number($GenericNutrient/PctDailyValue)">
					<xsl:value-of select="$GenericNutrient/PctDailyValue"/>
					<xsl:text>%</xsl:text>
				</xsl:if>
			</td>
		</tr>
		</xsl:if>
	</xsl:template>
	
<!-- ========================================================================================== -->
	
	<xsl:template name="AddToListControlLightwindow" match="GenericProduct">
		<xsl:param name="ProductID" select="ProductID"/>
		<xsl:param name="AddToListDiv" select="concat('ProductAddDiv:', ProductID, 'Lightwindow')"/>
		<xsl:param name="UpdateItemDiv" select="concat('ProductUpdateDiv:', ProductID, 'Lightwindow')"/>
		<xsl:param name="QuantitySelectID" select="concat('quantity:', ProductID, 'Lightwindow')"/>
		<xsl:param name="ShoppingListItem" select="//ExpressLane/Common/GenericShoppingList/Items/GenericShoppingListItem[ItemID=$ProductID and ItemTypeID=3]"/>
		<xsl:param name="TextBoxID" select="concat('comment:', ProductID, 'Lightwindow')"/>
		<xsl:param name="Weight" select="SoldByWeight"/>
		<xsl:param name="WeightSelectID" select="concat('weight:', ProductID,'LightWindow')"/>
		<div class="ProductAddToListControl">
			<div class="quantity-control group">
				<input type="text" maxlength="3">
					<xsl:attribute name="id">
						<xsl:value-of select="$QuantitySelectID"/>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="number($ShoppingListItem/Quantity)">
								<xsl:value-of select="number($ShoppingListItem/Quantity)"/>
							</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:if test="$Weight != ''">
						<xsl:attribute name="style">display:none;</xsl:attribute>
					</xsl:if>
				</input>
				<div class="plus-minus">
					<xsl:if test="$Weight != ''">
						<xsl:attribute name="style">display:none;</xsl:attribute>
					</xsl:if>
					<a class="ProductAddToListPlus">
						<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', 1, 99);</xsl:attribute>
					</a>
					<a class="ProductAddToListMinus">
						<xsl:attribute name="href">javascript:changeQuantity('<xsl:value-of select="$QuantitySelectID"/>', -1, 99);</xsl:attribute>
					</a>
				</div>
			</div>
			<div class="group">
				<xsl:attribute name="id">
					<xsl:value-of select="$AddToListDiv"/>
				</xsl:attribute>
				<xsl:if test="number($ShoppingListItem/ShoppingListItemID)">
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:none;</xsl:when>
							<xsl:otherwise>display:block;</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:if>

				<a>
					<xsl:attribute name="class">button</xsl:attribute>
					<xsl:attribute name="href">javascript:AddSearchProductToList(<xsl:value-of select="ProductID"/>, '<xsl:value-of select="$QuantitySelectID"/>', '<xsl:value-of select="$UpdateItemDiv"/>', '<xsl:value-of select="$AddToListDiv"/>');SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');</xsl:attribute>
					<span>Add</span>
				</a>
			</div>
			<xsl:if test="$Weight != ''">
				<select title="randomweight">
					<xsl:attribute name="id">
						<xsl:value-of select="$WeightSelectID"/>
					</xsl:attribute>
					<xsl:for-each select="VariableWieght/GenericFraction">
						<option>
							<xsl:attribute name="value">
								<xsl:value-of select="format-number(StoredValue, '0.##')"/>
							</xsl:attribute>
							<xsl:if test="number(StoredValue) = number($Weight) or number(StoredValue) &gt; number($Weight)">
								<xsl:if test="StoredValue - $Weight &lt; 0.25">
									<xsl:attribute name="selected"/>
								</xsl:if>
							</xsl:if>
							<xsl:value-of select="DisplayValue"/>
						</option>
					</xsl:for-each>
				</select>
				<script type="text/javascript">// work around to display selects in light window
								if ($('lightwindow_contents') != null) {
									lightwindow.prototype._toggleTroubleElements('visible', true);
								}</script>
				<xsl:choose>
					<xsl:when test="string-length(PriceUnit) &gt; 0">
						<span class="labelText">
							<xsl:value-of select="PriceUnit"/>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<span class="labelText">
							<xsl:text>lb.</xsl:text>
						</span>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<div>
				<xsl:attribute name="id">
					<xsl:value-of select="$UpdateItemDiv"/>
				</xsl:attribute>
				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="number($ShoppingListItem/ShoppingListItemID)">display:block;</xsl:when>
						<xsl:otherwise>display:none;</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<table>
					<tr>
						<td>
							<a>
								<xsl:attribute name="class">button</xsl:attribute>
								<xsl:attribute name="href">javascript:UpdateQuantityInShoppingList(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$QuantitySelectID"/>');SaveComment(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$TextBoxID"/>');</xsl:attribute>
								<span>Update</span>
							</a>
							<a>
								<xsl:attribute name="class">button</xsl:attribute>
								<xsl:attribute name="href">javascript:RemoveProductFromShoppingList(<xsl:value-of select="$ProductID"/>, '<xsl:value-of select="$AddToListDiv"/>', '<xsl:value-of select="$UpdateItemDiv"/>');</xsl:attribute>
								<span>Remove</span>
							</a>
						</td>
					</tr>
				</table>
				<div style="display:none;">
					<xsl:attribute name="class">
						<xsl:value-of select="concat('ItemData_', ProductID, '_3')"/>
					</xsl:attribute>
					<span class="ExportKeyID">
						<xsl:value-of select="ProductExportKeyID"/>
					</span>
					<span class="ExportKeyID">
						<xsl:value-of select="BrandExportKeyID"/>
					</span>
					<span class="ExportKeyID">
						<xsl:value-of select="DepartmentExportKeyID"/>
					</span>
					<span class="ExportKeyID">
						<xsl:value-of select="AisleExportKeyID"/>
					</span>
					<span class="ExportKeyID">
						<xsl:value-of select="CategoryExportKeyID"/>
					</span>
					<xsl:if test="CategoryExportKeyID != ShelfExportCategoryID">
						<span class="ExportKeyID">
							<xsl:value-of select="ShelfExportKeyID"/>
						</span>
					</xsl:if>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->
