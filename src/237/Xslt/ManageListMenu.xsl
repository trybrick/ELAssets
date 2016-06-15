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
                        <td class="icon">
                                <img alt="Add Your Own Item." src="/Assets/Common/Images/AddOwnItemsPencil.gif" />
                        </td>
                        <td valign="middle">
                            <input type="text" value="add your own item" onclick="this.value = '';" onkeypress="if (event.keyCode==13) AddOwnItem('legend'); return event.keyCode!=13;" title="name" ID="txtAddItem" />
                            <a href="javascript:AddOwnItem('legend');" class="button">
                                <span style="text-transform:capitalize; letter-spacing:0;"> Add </span>
                            </a>
                        
                        
                        </td>
                    </tr>
                </xsl:if>
				<tr class="print">
					<td class="icon">
						<a href="javascript:printList();">
							<img alt="Print Your ShoppingList" src="/Assets/Common/Images/print_icon.gif" />
						</a>
					</td>
					<td valign="middle">
						<a href="javascript:printList();">Print Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="email">
					<td class="icon">
						<a href="/Shop/EmailList.aspx" onclick="javascript:EmailShoppingList();">
							<img alt="Email Current List" src="/Assets/Common/Images/email_icon.gif" />
						</a>
					</td>
					<td valign="middle">
						<a href="/Shop/EmailList.aspx" onclick="javascript:EmailShoppingList();">Email Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="delete">
					<td class="icon">
					    <a href="javascript:ManageRemoveAllFromShoppingList();">
							<img alt="Delete All Items" src="/Assets/Common/Images/delete_icon.gif" />
						</a>
					</td>
					<td valign="middle">
						<a href="javascript:ManageRemoveAllFromShoppingList();">
							Delete Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose>
						</a>
					</td>
				</tr>
				<tr class="save">
					<td class="icon">
						<a href="javascript:ManageSaveList('txtSaveList');">
                        	<img alt="Save Current List." src="/assets/common/images/save_icon.gif" />
                        </a>
					</td>
       				<td valign="middle">
						<a href="javascript:ManageSaveList('txtSaveList');">
							Save Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose> As:
						</a>
					</td>
				</tr>	
				<tr class="save saveinput">
					<td class="icon"/>
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
				    <td class="icon">
				        <a>
                        	<xsl:attribute name="href">javascript:NewShoppingList();</xsl:attribute> 
                            <xsl:choose>
                                <xsl:when test="$IsOGS = 'true'">
                                  <xsl:attribute name="onclick">alert('Your cart has been saved.')</xsl:attribute> 
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:attribute name="onclick">alert('Your list has been saved.')</xsl:attribute> 
                                </xsl:otherwise>
                            </xsl:choose>
                            
                        	<img alt="New List" src="/assets/common/images/new_list_icon.gif" />
                        </a>
				    </td>
				    <td valign="middle">
				        <a>
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
					<td class="icon">
						<a href="/Shop/SavedLists.aspx">
							<img alt="View Saved Lists" src="/Assets/Common/Images/saved_icon.gif" />
						</a>
					</td>
					<td valign="middle">
						<a href="/Shop/SavedLists.aspx">View Saved <xsl:choose><xsl:when test="$IsOGS = 'true'"> Carts </xsl:when><xsl:otherwise> Lists </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="checkOutList">
				    <td class="icon" />
				    <td valign="middle">
				        <a href="/Shop/CheckOut.aspx">
				            Check Out <xsl:choose><xsl:when test="$IsOGS = 'true'"> Cart </xsl:when><xsl:otherwise> List </xsl:otherwise></xsl:choose>
				        </a>
				    </td>
				</tr>
				<xsl:for-each select="//ExpressLane/ArrayOfStaticContent/StaticContent">
					<tr>
						<td class="icon">
							<xsl:if test="string-length(Image) &gt; 0">
								<img>
									<xsl:attribute name="alt">
										<xsl:value-of select="Title" />
									</xsl:attribute>
									<xsl:attribute name="src">
										<xsl:value-of select="Image" />
									</xsl:attribute>
								</img>
							</xsl:if>
						</td>
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