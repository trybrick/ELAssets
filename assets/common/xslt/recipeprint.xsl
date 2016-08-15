<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
	<html>
		<body>
			<table height="100%" width="100%">
				<tbody>
					<tr height="50%">
						<td vAlign="top" align="center" width="45%" style="height: 50%">Preparation 
							<br/>
							<br/>
							<table height="90%" width="90%">
								<tbody>
									<tr>
										<td vAlign="top">
											<xsl:for-each select="ExpressLane/RecipeFull/RecipeInstructions">
												<xsl:value-of select="RecipeInstruction"/>
												<br/>
											</xsl:for-each>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td vAlign="middle" align="center" width="45">
							<table height="90%" width="90%" border="2" style="border-right: 1px; border-top: 1px; ; height: 90%; border-: 90%">
								<tbody>
									<tr>
										<td align="center" style="writing-mode: tb-rl">
											<xsl:value-of select="ExpressLane/RecipeFull/RecipeDetails/RecipeTitle"/>
											<br/>
											<xsl:value-of select="ExpressLane/RecipeFull/RecipeDetails/YieldText"/>
											<br/>Estimated Total Time: 
											<xsl:value-of select="ExpressLane/RecipeFull/RecipeDetails/EstimatedTime"/> (mins) 
											<br/>© 1998 - 2004 Grocery Shopping Network. All rights reserved 
										</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td vAlign="bottom" align="right" width="45%">
							<div align="right" vAlign="bottom" style="writing-mode: tb-rl">
								<xsl:value-of select="ExpressLane/RecipeFull/RecipeDetails/RecipeTitle"/>
							</div>
						</td>
					</tr>
					<tr height="50%">
						<td vAlign="top" align="center" width="45%">Cooking Tips 
							<br/>
							<br/>
							<table height="90%" width="90%">
								<tbody>
									<tr>
										<td vAlign="top">
											<ul>
												<li value="0">Read the recipe through before beginning to cook.</li>
												<li value="0">Measure and set out all the ingredients first.</li>
												<li value="0">Wash and dry all produce before proceeding with the recipe.</li>
												<li value="0">Measure liquids in glass or clear plastic measuring cups.</li>
												<li value="0">Measure dry ingredients in measuring cups that can be leveled off with a straight edge.</li>
												<li value="0">Measure flour by spooning it into a measuring cup and leveling it off with a straight-edge. Do not tap or shake cup. Do not scoop.</li>
												<li value="0">Measure skillets and baking pans accross the bottom, not the top.</li>
												<li value="0">Freshly ground black pepper is preferable to preground.</li>
												<li value="0">Grate cheese just before using.</li>
												<li value="0">Most recipes call for large eggs. Do not substitute other sizes.</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td vAlign="top" align="center" width="45%">Ingredients 
							<br/>
							<br/>
							<table height="90%" width="90%">
								<tbody>
									<tr>
										<td vAlign="top">
											<ul>
												<xsl:for-each select="ExpressLane/RecipeFull/RecipeIngredientLines">
													<xsl:sort select="DisplayOrder"/>
													<li value="0">
														<xsl:value-of select="IngredientLine"/>
													</li>
												</xsl:for-each>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td width="10%"/>
					</tr>
				</tbody>
			</table>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="RecipePrint" userelativepaths="yes" externalpreview="no" url="RecipeFull.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="RecipePrint.xml" srcSchemaRoot="NewDataSet" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/table/tbody/tr/td/table/tbody/tr/td/xsl:for&#x2D;each" x="376" y="180"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->