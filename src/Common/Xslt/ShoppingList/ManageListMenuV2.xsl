<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="ManageListMenu">
			<xsl:apply-templates select="//GenericShoppingList"/>
		</div>
	</xsl:template>
	<xsl:template name="ManageListMenu" match="GenericShoppingList">
		<xsl:variable name="IsOGS" select="//GenericConsumer/ConsumerSettings/Setting[Name='OGSConsumer']/Value"/>
        <xsl:variable name="CartOrList">
            <xsl:choose>
                <xsl:when test="$IsOGS='true'">
                    <xsl:text>cart</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>list</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
		<div id="legend" title="managelist">
			<table>
				<tr class="message">
					<th colspan="2">
						<h2>
							<xsl:value-of select="concat('Current ',$CartOrList)" />:<br/>
                            <h3>"<xsl:value-of select="ShoppingList/Title"/>"</h3>
						</h2>
						<xsl:if test="ShoppingList/ShoppingListStatusID=2">
                            <p><xsl:value-of select="concat('This shopping ',$CartOrList, ' has been saved.')" /></p>
						</xsl:if>
					</th>
				</tr>
				<xsl:if test="//ChainSettings/Setting[Name='EnableOwnItems']/Value= 'True'">
					<tr class="ownItem">
						<td class="icon">
							<img alt="Add Your Own Item." src="/Assets/Common/Images/AddOwnItemsPencil.gif"/>
						</td>
						<td valign="middle">
							<input type="text" value="add your own item" onclick="this.value = '';" onkeypress="if (event.keyCode==13) AddOwnItem('legend'); return event.keyCode!=13;" title="name" ID="txtAddItem"/>
							<a href="javascript:AddOwnItem('legend');" class="button">
								<span style="text-transform:capitalize; letter-spacing:0;"> Add </span>
							</a>
						</td>
					</tr>
				</xsl:if>
				<tr class="print">
					<td class="icon">
						<a href="javascript:printList();">
							<img alt="Print Your ShoppingList">
								<xsl:attribute name="src">
									<xsl:choose>
										<xsl:when test="//manageListIcons/printIcon">
											<xsl:value-of select="//manageListIcons/printIcon"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>/Assets/Common/Images/print_icon.gif</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
						</a>
					</td>
					<td valign="middle">
                        <a href="javascript:printList();">
                            <xsl:value-of select="concat('Print current ',$CartOrList)" />
                        </a>
					</td>
				</tr>
				<tr class="email">
					<td class="icon">
						<a href="/Shop/EmailList.aspx" onclick="javascript:EmailShoppingList();">
							<img alt="Email Current List">
								<xsl:attribute name="src">
									<xsl:choose>
										<xsl:when test="//manageListIcons/emailIcon">
											<xsl:value-of select="//manageListIcons/emailIcon"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>/Assets/Common/Images/email_icon.gif</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
						</a>
					</td>
					<td valign="middle">
                        <a href="/Shop/EmailList.aspx" onclick="javascript:EmailShoppingList();">
                            <xsl:value-of select="concat('Email current ',$CartOrList)" />
                        </a>
					</td>
				</tr>
				<tr class="delete">
					<td class="icon">
						<a href="javascript:ManageRemoveAllFromShoppingList();">
							<img alt="Delete All Items">
								<xsl:attribute name="src">
									<xsl:choose>
										<xsl:when test="//manageListIcons/deleteIcon">
											<xsl:value-of select="//manageListIcons/deleteIcon"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>/Assets/Common/Images/delete_icon.gif</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
						</a>
					</td>
					<td valign="middle">
						<a href="javascript:ManageRemoveAllFromShoppingList();">
                            <xsl:value-of select="concat('Delete current ',$CartOrList)" />
                        </a>
					</td>
				</tr>
				<tr class="save">
					<td class="icon">
				        <a>
                        	<xsl:attribute name="href">javascript:ManageSaveList('txtSaveList');</xsl:attribute> 
                            <xsl:choose>
                                <xsl:when test="$IsOGS = 'true'">
                                  <xsl:attribute name="onclick">alert('Your cart has been saved.')</xsl:attribute> 
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:attribute name="onclick">alert('Your list has been saved.')</xsl:attribute> 
                                </xsl:otherwise>
                            </xsl:choose>
						<img alt="Save Current List.">
							<xsl:attribute name="src">
								<xsl:choose>
									<xsl:when test="//manageListIcons/saveIcon">
										<xsl:value-of select="//manageListIcons/saveIcon"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>/Assets/Common/Images/save_icon.gif</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</img>
					</a>
					</td>
					<td valign="middle">
						<a href="javascript:ManageSaveList('txtSaveList');">
							Save Current <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart </xsl:when><xsl:otherwise> list </xsl:otherwise></xsl:choose> as:
						</a>
					</td>
				</tr>
				<tr class="save">
					<td class="icon"/>
					<td valign="middle">
						<input id="txtSaveList" type="text" onclick="this.value = '';" onkeypress="if (event.keyCode==13) ManageSaveList('txtSaveList'); return event.keyCode!=13;">
							<xsl:attribute name="value">
								<xsl:value-of select="ShoppingList/Title"/>
							</xsl:attribute>
						</input>
						<a href="javascript:ManageSaveList('txtSaveList');" class="button">
							<span style="text-transform:capitalize; letter-spacing:0;"> Save </span>
						</a>
					</td>
				</tr>
				<tr class="new">
					<td class="icon">
<a><xsl:attribute name="href">javascript:NewShoppingList();</xsl:attribute><xsl:choose><xsl:when test="$IsOGS = 'true'"><xsl:attribute name="onclick">alert('Your cart has been saved.')</xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="onclick">alert('Your list has been saved.')</xsl:attribute></xsl:otherwise></xsl:choose>
							<img alt="New List">
								<xsl:attribute name="src">
									<xsl:choose>
										<xsl:when test="//manageListIcons/startNewListIcon">
											<xsl:value-of select="//manageListIcons/startNewListIcon"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>/Assets/Common/Images/new_list_icon.gif</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
						</a>
					</td>
					<td valign="middle">
						<a><xsl:attribute name="href">javascript:NewShoppingList();</xsl:attribute><xsl:choose><xsl:when test="$IsOGS = 'true'"><xsl:attribute name="onclick">alert('Your cart has been saved.')</xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="onclick">alert('Your list has been saved.')</xsl:attribute></xsl:otherwise></xsl:choose>
                            Start new <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart </xsl:when><xsl:otherwise> list </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="savedLists">
					<td class="icon">
						<a href="/Shop/SavedLists.aspx">
							<img alt="View Saved Lists">
								<xsl:attribute name="src">
									<xsl:choose>
										<xsl:when test="//manageListIcons/savedListIcon">
											<xsl:value-of select="//manageListIcons/savedListIcon"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>/Assets/Common/Images/saved_icon.gif</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
						</a>
					</td>
					<td valign="middle">
						<a href="/Shop/SavedLists.aspx">View saved <xsl:choose><xsl:when test="$IsOGS = 'true'"> carts </xsl:when><xsl:otherwise> lists </xsl:otherwise></xsl:choose></a>
					</td>
				</tr>
				<tr class="checkOutList">
					<td class="icon"/>
					<td valign="middle">
						<a href="/Shop/CheckOut.aspx">
				            Check out <xsl:choose><xsl:when test="$IsOGS = 'true'"> cart </xsl:when><xsl:otherwise> list </xsl:otherwise></xsl:choose>
				        </a>
					</td>
				</tr>
				<xsl:for-each select="//ExpressLane/ArrayOfStaticContent/StaticContent">
					<tr>
						<td class="icon">
							<xsl:if test="string-length(Image) &gt; 0">
								<img>
									<xsl:attribute name="alt">
										<xsl:value-of select="Title"/>
									</xsl:attribute>
									<xsl:attribute name="src">
										<xsl:value-of select="Image"/>
									</xsl:attribute>
								</img>
							</xsl:if>
						</td>
						<td>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Description"/>
								</xsl:attribute>
								<xsl:value-of select="Title"/>
							</a>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
		<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">
			<script type="text/javascript"><![CDATA[
				Event.observe(window, 'scroll', CheckSideColumnPosition);
				]]></script>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
