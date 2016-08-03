<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
<xsl:output method="html"/>

<xsl:template match="/">
<xsl:if test="ExpressLane/RecipeNutrition/Nutrition/NutrientDefinitionID">
	
<!-- testing only
link id="stylegeneral" rel="stylesheet" type="text/css" media="screen" href="http://villagemarket.beta.groceryshopping.net/Assets/Common/Layouts/2ColLeft/default.css" />
-->

	<div id="NutritionTable" class="clearfix">
	<table width="100%"  class="NutritionLineItem">
		<tbody>
			<tr>
				<td colspan="2">
					<h2>Nutrition Facts</h2>
						Nutrition information is provided as a resource. Values will vary depending on specific ingredients used.
				</td>
			</tr>

			<tr>
				<td width="35%">
					Serving Size 1
					<br/>
					Number of Servings 
					<xsl:value-of select="ExpressLane/RecipeNutrition/RecipeDetails/YieldText"/>
						
				</td>
				<td>
					Amount Per Serving
						<br/>
					Calories&#160; 
					<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
					<xsl:if test="NutrientDefinitionID=208">
							<xsl:value-of select="round(NutrientAmount)"/>
					</xsl:if>
					</xsl:for-each>
					Calories from Fat&#160; 
					<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
					<xsl:if test="NutrientDefinitionID=204">
							<xsl:value-of select="round(NutrientAmount)*9"/>
					</xsl:if>
					</xsl:for-each>
					
				</td>
			</tr>
		</tbody>
	</table>
	
	<hr class="thin"/>
	
	<table width="98%" class="NutritionLineItem" align="center">
			<tbody>
				<tr><td>				
				<table width="100%" class="NutritionFullLineItem">
					<tbody>
						<tr>
							<td width="32%">
								Amount per Serving
							</td>
							<td align="center">% Daily Value*
							</td>
							<td width="32%">
								Amount per Serving
							</td>
							<td align="center">
								% Daily Value*
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<hr class="thick"/>
							</td>
						</tr>
					</tbody>
				</table>
			</td></tr>
			
			<tr><td>
				
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 204">
				<div id="NutritionLineColumn">
						<table width="100%" id="NutritionLineItem">
							<tbody>
								<tr>
								<td width="90%">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
										<xsl:if test="NutrientAmount &gt; 1">
											<xsl:value-of select="round(NutrientAmount)"/>
										</xsl:if>
										<xsl:if test="NutrientAmount &lt; 1">
											<xsl:if test="NutrientAmount &gt; 0">
												&lt; 1
												</xsl:if>
											</xsl:if>
										<xsl:value-of select="MeasureUnit"/>
								</td>
								<td><xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
						<hr class="thin"/>
				</div>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 205">
				<div id="NutritionLineColumn">
							<table width="100%" id="NutritionLineItem">
								<tbody>
									<tr>
									<td width="90%">
											<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
											<xsl:if test="NutrientAmount &gt; 1">
												<xsl:value-of select="round(NutrientAmount)"/>
											</xsl:if>
											<xsl:if test="NutrientAmount &lt; 1">
												<xsl:if test="NutrientAmount &gt; 0">
													&lt; 1
													</xsl:if>
												</xsl:if>
											<xsl:value-of select="MeasureUnit"/>
									</td>
									<td><xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
									</tr>
								</tbody>
								</table>
								<hr class="thin"/>
					</div>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 606">
				<div id="NutritionLineColumn">
						<table width="100%" id="NutritionLineItem">
							<tbody>
								<tr>
								<td width="90%">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
										<xsl:if test="NutrientAmount &gt; 1">
											<xsl:value-of select="round(NutrientAmount)"/>
										</xsl:if>
										<xsl:if test="NutrientAmount &lt; 1">
											<xsl:if test="NutrientAmount &gt; 0">
												&lt; 1
												</xsl:if>
											</xsl:if>
										<xsl:value-of select="MeasureUnit"/>
								</td>
								<td><xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
							<hr class="thin"/>
				</div>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 291">
				<div id="NutritionLineColumn">
						<table width="100%" id="NutritionLineItem">
							<tbody>
								<tr>
								<td width="90%">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
										<xsl:if test="NutrientAmount &gt; 1">
											<xsl:value-of select="round(NutrientAmount)"/>
										</xsl:if>
										<xsl:if test="NutrientAmount &lt; 1">
											<xsl:if test="NutrientAmount &gt; 0">
												&lt; 1
												</xsl:if>
											</xsl:if>
										<xsl:value-of select="MeasureUnit"/>
								</td>
								<td><xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
							<hr class="thin"/>
				</div>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 601">
				<div id="NutritionLineColumn">
						<table width="100%" id="NutritionLineItem">
							<tbody>
								<tr>
								<td width="90%">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
										<xsl:if test="NutrientAmount &gt; 1">
											<xsl:value-of select="round(NutrientAmount)"/>
										</xsl:if>
										<xsl:if test="NutrientAmount &lt; 1">
											<xsl:if test="NutrientAmount &gt; 0">
												&lt; 1
												</xsl:if>
											</xsl:if>
										<xsl:value-of select="MeasureUnit"/>
								</td>
								<td><xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
							<hr class="thin"/>
				</div>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 208">
				<div id="NutritionLineColumn">
						<table width="100%" id="NutritionLineItem">
							<tbody>
								<tr>
								<td width="90%">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
										<xsl:if test="NutrientAmount &gt; 1">
											<xsl:value-of select="round(NutrientAmount)"/>
										</xsl:if>
										<xsl:if test="NutrientAmount &lt; 1">
											<xsl:if test="NutrientAmount &gt; 0">
												&lt; 1
												</xsl:if>
											</xsl:if>
										<xsl:value-of select="MeasureUnit"/>
								</td>
								<td><xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
							<hr class="thin"/>
				</div>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 307">
				<div id="NutritionLineColumn">
						<table width="100%" id="NutritionLineItem">
							<tbody>
								<tr>
								<td width="90%">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
										<xsl:if test="NutrientAmount &gt; 1">
											<xsl:value-of select="round(NutrientAmount)"/>
										</xsl:if>
										<xsl:if test="NutrientAmount &lt; 1">
											<xsl:if test="NutrientAmount &gt; 0">
												&lt; 1
												</xsl:if>
											</xsl:if>
										<xsl:value-of select="MeasureUnit"/>
								</td>
								<td><xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
							<hr class="thick"/>
				</div>
			</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 203">
				<div id="NutritionLineColumn">
						<table width="100%" id="NutritionLineItem">
							<tbody>
								<tr>
								<td width="90%">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
										<xsl:if test="NutrientAmount &gt; 1">
											<xsl:value-of select="round(NutrientAmount)"/>
										</xsl:if>
										<xsl:if test="NutrientAmount &lt; 1">
											<xsl:if test="NutrientAmount &gt; 0">
												&lt; 1
												</xsl:if>
											</xsl:if>
										<xsl:value-of select="MeasureUnit"/>
								</td>
								<td><xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
							<hr class="thick"/>
				</div>
			</xsl:if>
			</xsl:for-each>

			</td></tr>
		</tbody>
		</table>






<!-- Vitamins,Calcium and Iron -->

	<table width="100%" class="NutritionLineItem">
			<tbody>
			<tr><td>


				<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
				<xsl:if test="NutrientDefinitionID = 318">
					<div id="NutritionLineHalfColumn">
							<table id="NutritionLineItem">
								<tbody>
									<tr>
									<td colspan="2">
											<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text> 
											<xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
									</tr>
								</tbody>
								</table>
					</div>
				</xsl:if>
				</xsl:for-each>

				<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
				<xsl:if test="NutrientDefinitionID = 401">
					<div id="NutritionLineHalfColumn">
							<table id="NutritionLineItem">
								<tbody>
									<tr>
									<td width="85%" align="right">
											<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text> 
									</td>
									<td>
											<xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
									</tr>
								</tbody>
								</table>
					</div>
				</xsl:if>
				</xsl:for-each>
			
			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 301">
				<div id="NutritionLineHalfColumn">
						<table id="NutritionLineItem">
							<tbody>
								<tr>
								<td colspan="2">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text>
										<xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
				</div>
			</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="ExpressLane/RecipeNutrition/Nutrition">
			<xsl:if test="NutrientDefinitionID = 303">
				<div id="NutritionLineHalfColumn">
						<table id="NutritionLineItem">
							<tbody>
								<tr>
								<td width="85%" align="right">
										<xsl:value-of select="NutrientDescription"/><xsl:text> </xsl:text> 
								</td>
								<td>
										<xsl:value-of select="round((NutrientAmount div RDA) * 100)"/><![CDATA[%]]></td>
								</tr>
							</tbody>
							</table>
				</div>
			</xsl:if>
			</xsl:for-each>



		</td></tr>
		<tr><td>
			<em>*Percent Daily Values are based on a 2,000 calorie diet. Your daily values may be higher or lower depending on your calorie needs.</em>
		</td></tr>
		</tbody>
	</table>
</div>
</xsl:if>
	
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Nutrition" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Desktop\xml\Nutrition.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
--><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Nutrition" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Desktop\xml\Nutrition.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="" ><advancedProp name="sInitialMode" value=""/><advancedProp name="bXsltOneIsOkay" value="true"/><advancedProp name="bSchemaAware" value="false"/><advancedProp name="bXml11" value="false"/><advancedProp name="iValidation" value="0"/><advancedProp name="bExtensions" value="true"/><advancedProp name="iWhitespace" value="0"/><advancedProp name="sInitialTemplate" value=""/><advancedProp name="bTinyTree" value="true"/><advancedProp name="bWarnings" value="true"/><advancedProp name="bUseDTD" value="false"/><advancedProp name="iErrorHandling" value="fatal"/></scenario></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->