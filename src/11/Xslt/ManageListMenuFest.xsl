<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:apply-templates select="//GenericShoppingList" />
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
				<tr class="ownItem">
					<td class="icon">
							<img alt="Add Your Own Item." src="/Assets/11/Images/manage_addown.gif" />
					</td>
					<td valign="middle">
						<input type="text" value="add your own item" onclick="this.value = '';" onkeypress="if (event.keyCode==13) AddOwnItem('legend'); return event.keyCode!=13;" title="name" ID="txtAddItem" />
                        <a href="javascript:AddOwnItem('legend');" class="button">
                            <span style="text-transform:capitalize; letter-spacing:0;"> Add </span>
                        </a>
                    
                    
					</td>
				</tr>
				<tr class="print">
					<td class="icon">
						<a href="javascript:printList();">
							<img alt="Print Your ShoppingList" src="/Assets/11/Images/manage_print.gif" />
						</a>
					</td>
					<td valign="middle">
						<a href="javascript:printList();">PRINT CURRENT <xsl:choose><xsl:when test="$IsOGS = 'true'"> CART </xsl:when><xsl:otherwise> LIST </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="email">
					<td class="icon">
						<a href="/Shop/EmailList.aspx" onclick="javascript:EmailShoppingList();">
							<img alt="Email Current List" src="/Assets/11/Images/manage_email.gif" />
						</a>
					</td>
					<td valign="middle">
						<a href="/Shop/EmailList.aspx" onclick="javascript:EmailShoppingList();">EMAIL CURRENT <xsl:choose><xsl:when test="$IsOGS = 'true'"> CART </xsl:when><xsl:otherwise> LIST </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="delete">
					<td class="icon">
					    <a href="javascript:ManageRemoveAllFromShoppingList();">
							<img alt="Delete All Items" src="/Assets/11/Images/manage_delete.gif" />
						</a>
					</td>
					<td valign="middle">
						<a href="javascript:ManageRemoveAllFromShoppingList();">
							DELETE CURRENT <xsl:choose><xsl:when test="$IsOGS = 'true'"> CART </xsl:when><xsl:otherwise> LIST </xsl:otherwise></xsl:choose>
						</a>
					</td>
				</tr>
				<tr class="save">
					<td class="icon">
						<img alt="Save Current List." src="/assets/11/images/manage_save.gif" />
					</td>
       				<td valign="middle">
						<a href="javascript:ManageSaveList('txtSaveList');">
							SAVE CURRENT <xsl:choose><xsl:when test="$IsOGS = 'true'"> CART </xsl:when><xsl:otherwise> LIST </xsl:otherwise></xsl:choose> AS:
						</a>
					</td>
				</tr>	
				<tr class="save">
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
				        <img alt="New List" src="/assets/11/images/manage_newlist.gif" />
				    </td>
				    <td valign="middle">
				        <a href="javascript:NewShoppingList();" onclick="alert('Your list has been saved.')">START NEW <xsl:choose><xsl:when test="$IsOGS = 'true'"> CART </xsl:when><xsl:otherwise> LIST </xsl:otherwise></xsl:choose></a>
				    </td>
				</tr>
				<tr class="savedLists">
					<td class="icon">
						<a href="/Shop/SavedLists.aspx">
							<img alt="View Saved Lists" src="/Assets/11/Images/manage_viewsaved.gif" />
						</a>
					</td>
					<td valign="middle">
						<a href="/Shop/SavedLists.aspx">VIEW SAVED <xsl:choose><xsl:when test="$IsOGS = 'true'"> CARTS </xsl:when><xsl:otherwise> LISTS </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="checkOutList">
				    <td class="icon" />
				    <td valign="middle">
				        <a href="/Shop/CheckOut.aspx">
				            CHECK OUT <xsl:choose><xsl:when test="$IsOGS = 'true'"> CART </xsl:when><xsl:otherwise> LIST </xsl:otherwise></xsl:choose>
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
</xsl:stylesheet>