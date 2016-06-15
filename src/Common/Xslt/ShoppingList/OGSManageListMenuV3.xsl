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
		<xsl:variable name="CartOrList">
			<xsl:choose><xsl:when test="$IsOGS = 'true'">cart</xsl:when><xsl:otherwise>list</xsl:otherwise></xsl:choose>
		</xsl:variable>
		<!-- Need to use <xsl:text> to preserve white space -->
		<div id="legend">
			<div class="hgroup">
				<h2>
					<xsl:text>Current </xsl:text><xsl:value-of select="$CartOrList" />:
				</h2>
				<h3><xsl:value-of select="ShoppingList/Title" /></h3>
				<xsl:if test="ShoppingList/ShoppingListStatusID=2">
					<p><xsl:text>This shopping </xsl:text><xsl:value-of select="$CartOrList" /><xsl:text> has been saved.</xsl:text></p>
				</xsl:if>
			</div>
			<ul>
	            <xsl:if test="//ChainSettings/Setting[Name='EnableOwnItems']/Value= 'True'">
		            <li>
						<input type="text" value="add your own item" onclick="this.value = '';" onkeypress="if (event.keyCode==13) AddOwnItem('legend'); return event.keyCode!=13;" title="name" ID="txtAddItem" />
		            	<a href="javascript:AddOwnItem('legend');" class="button">
		                	<span>Add</span>
		            	</a>
					</li>
	            </xsl:if>
				<li class="print">
					<a class="text-link" href="javascript:printList();">
						<xsl:text>Print current </xsl:text><xsl:value-of select="$CartOrList" />
					</a>
				</li>
				<li class="email">
					<a class="text-link" href="/Shop/EmailList.aspx" onclick="javascript:EmailShoppingList();">
						<xsl:text>Email current </xsl:text><xsl:value-of select="$CartOrList" />
					</a>
				</li>
				
	
	
				<li class="delete">
					<a class="text-link" href="javascript:ManageRemoveAllFromShoppingList();">
						<xsl:text>Delete current </xsl:text><xsl:value-of select="$CartOrList" />
					</a>
				</li>
				<li class="save">
					<a class="text-link" href="javascript:ManageSaveList('txtSaveList');">
						<xsl:text>Save current </xsl:text><xsl:value-of select="$CartOrList" /><xsl:text> as:</xsl:text>
					</a>
					<input id="txtSaveList" type="text" onclick="this.value = '';" onkeypress="if (event.keyCode==13) ManageSaveList('txtSaveList'); return event.keyCode!=13;" value="{ShoppingList/Title}" />
	                <a href="javascript:ManageSaveList('txtSaveList');" class="button">
	                    <span>Save</span>
	                </a>
				</li>
				<li class="new">
			        <a class="text-link" href="javascript:NewShoppingList();">
	                    <xsl:choose>
	                        <xsl:when test="$IsOGS = 'true'">
	                          <xsl:attribute name="onclick">alert('Your cart has been saved.')</xsl:attribute> 
	                        </xsl:when>
	                        <xsl:otherwise>
	                          <xsl:attribute name="onclick">alert('Your list has been saved.')</xsl:attribute> 
	                        </xsl:otherwise>
	                    </xsl:choose>
	                    <xsl:text>Start new </xsl:text><xsl:value-of select="$CartOrList" />
					</a>
				</li>
				<li class="savedLists">
					<a class="text-link" href="/Shop/SavedLists.aspx"><xsl:text>View saved </xsl:text><xsl:value-of select="concat($CartOrList,'s')" /></a>
				</li>
				<li class="checkOutList">
			        <a class="text-link" href="/Shop/CheckOut.aspx">
			            <xsl:text>Check out </xsl:text> <xsl:value-of select="$CartOrList" />
			        </a>
				</li>
				<xsl:for-each select="//ExpressLane/ArrayOfStaticContent/StaticContent">
					<xsl:value-of select="Description" disable-output-escaping="yes" />
				</xsl:for-each>
			</ul>
		</div>
		<xsl:if test="//GenericChain/ChainSettings/Setting[Name = 'EnableFloatingShoppingList']/Value = 'True'">
			<script type="text/javascript"><![CDATA[
				Event.observe(window, 'scroll', CheckSideColumnPosition);
				]]>
			</script>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. --><!-- Stylesheet edited using Stylus Studio - (c) 2004-2009. Progress Software Corporation. All rights reserved. -->