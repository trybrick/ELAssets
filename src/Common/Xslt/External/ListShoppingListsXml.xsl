<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:template match="/">
		<xsl:for-each select="ExpressLane/ArrayOfShoppingList">
			<xsl:call-template name="ArrayOfShoppingList" />
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ArrayOfShoppingList" name="ArrayOfShoppingList">
		<ArrayOfShoppingList xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:for-each select="ShoppingList">
				<xsl:call-template name="ShoppingList" />
			</xsl:for-each>
		</ArrayOfShoppingList>
	</xsl:template>
	<xsl:template match="ShoppingList" name="ShoppingList">
		<ShoppingList xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:copy-of select="ShoppingListID" />
			<xsl:copy-of select="Title" />
			<xsl:copy-of select="CreatedOn" />
			<xsl:copy-of select="ShoppingListStatusID" />
		</ShoppingList>
	</xsl:template>
</xsl:stylesheet>