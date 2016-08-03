<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<div id="ManageListMenu">
			<xsl:apply-templates select="//GenericShoppingList" />
		</div>
	</xsl:template>
	<xsl:template name="ManageListMenu" match="GenericShoppingList">
    <xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
	
		<div id="legend" title="managelist">
			<table>
				<tr class="message">
					<th colspan="2">
						<h2>
							Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose>:<br/>
                            <h3>&#34;<xsl:value-of select="ShoppingList/Title" />&#34;</h3>
						</h2>
						<xsl:if test="ShoppingList/ShoppingListStatusID=2">	
							<p>This shopping <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart </xsl:when><xsl:otherwise> list </xsl:otherwise></xsl:choose> has been saved.</p>
						</xsl:if>
					</th>
				</tr>
                <xsl:if test="//ChainSettings/Setting[Name='EnableOwnItems']/Value= 'True'">
                    <tr class="ownItem">
                        <td valign="middle">
                            <input type="text" value="add your own item" onclick="this.value = '';" onkeypress="if (event.keyCode==13) AddOwnItem('legend'); return event.keyCode!=13;" title="name" ID="txtAddItem" />
                            <a href="javascript:AddOwnItem('legend');" class="button">
                                <span style="text-transform:capitalize; letter-spacing:0;"> Add </span>
                            </a>
                        
                        
                        </td>
                    </tr>
                </xsl:if>
				<tr class="print">
					
					<td valign="middle">
						<a href="javascript:printList();" class="text-link">Print Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="email">
					
					<td valign="middle">
						<a href="/Shop/EmailList.aspx" class="text-link">Email Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="delete">
					
					<td valign="middle">
						<a href="javascript:ManageRemoveAllFromShoppingList();" class="text-link">
							Delete Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose>
						</a>
					</td>
				</tr>
				<tr class="save">
					
       				<td valign="middle">
						<a href="javascript:ManageSaveList('txtSaveList');" class="text-link">
							Save Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose> As:
						</a>
					</td>
				</tr>	
				<tr class="save saveinput">
					
					<td valign="middle">
						<input id="txtSaveList" type="text" onclick="this.value = '';" onkeypress="if (event.keyCode==13) ManageSaveList('txtSaveList'); return event.keyCode!=13;">
							<xsl:attribute name="value">
								<xsl:value-of select="ShoppingList/Title" />
							</xsl:attribute>
						</input>
                        <a href="javascript:ManageSaveList('txtSaveList');" class="button">
                            <span style="text-transform:capitalize; letter-spacing:0;"> Save </span>
                        </a>
					</td>
				</tr>
				<tr class="new">
				   
				    <td valign="middle">
				        <a class="text-link">
                        	<xsl:attribute name="href">javascript:NewShoppingList();</xsl:attribute> 
                            <xsl:choose>
                                <xsl:when test="$IsOGS = 'true'">
                                  <xsl:attribute name="onclick">alert('Your cart has been saved.')</xsl:attribute> 
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:attribute name="onclick">alert('Your list has been saved.')</xsl:attribute> 
                                </xsl:otherwise>
                            </xsl:choose>
                            Start New <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose></a>
				    </td>
				</tr>
				<tr class="savedLists">
					
					<td valign="middle">
						<a href="/Shop/SavedLists.aspx" class="text-link">View Saved <xsl:choose><xsl:when test="$IsOGS = 'true'"> Carts </xsl:when><xsl:otherwise> Lists </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="checkOutList">
				    <td valign="middle">
				        <a href="/Shop/CheckOut.aspx" class="text-link">
				            Check Out <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose>
				        </a>
				    </td>
				</tr>
				<xsl:for-each select="//ExpressLane/ArrayOfStaticContent/StaticContent">
					<tr>
						<td>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Description" />
								</xsl:attribute>
								<xsl:value-of select="Title" />
							</a>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
		<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">
			<script type="text/javascript"><![CDATA[
				Event.observe(window, 'scroll', CheckSideColumnPosition);
				]]>
			</script>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\98\XmlData\98-PageTypeId-142-ManageListMenu.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->