<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
		<script type="text/javascript">
			<xsl:comment>
				document.location = 'Recipes/RecipeCenter.aspx';
			</xsl:comment>
		</script>
		
	</xsl:template>
</xsl:stylesheet>