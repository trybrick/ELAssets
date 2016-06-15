<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:key name="meals-by-date" match="MealPlanner" use="DisplayDate"/>
	<xsl:template match="/">
	    <script id="jsImage" type="text/javascript" language="javascript">
	      <xsl:comment>
	        <![CDATA[
	     			function redirectPage()
	        		{
	                window.location = "index.aspx?linkid=0"
	        		}
					]]>
	      </xsl:comment>
	    </script>
	    <script id="js" type="text/javascript" language="javascript">
	      redirectPage();
	    </script>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\..\..\Village Market-Home.xml" htmlbaseurl="" outputurl="" processortype="msxml6" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="..\..\..\..\Village Market-Home.xml" srcSchemaRoot="ExpressLane" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="div/div/div/a[1]/xsl:for-each" x="63" y="41"/>
				<block path="div/div/div/a[1]/xsl:for-each/xsl:if/=[0]" x="87" y="69"/>
				<block path="div/div/div/a[1]/xsl:for-each/xsl:if" x="133" y="71"/>
				<block path="div/div[2]/div/a/img/xsl:attribute/xsl:value-of" x="213" y="31"/>
				<block path="div/div[2]/div[1]/a/img/xsl:attribute/xsl:value-of" x="253" y="31"/>
				<block path="div/div[3]/div/a/img/xsl:attribute/xsl:value-of" x="173" y="31"/>
				<block path="div/div[3]/div[1]/a/img/xsl:attribute/xsl:value-of" x="133" y="31"/>
				<block path="div/div[4]/xsl:for-each" x="253" y="71"/>
				<block path="div/div[4]/xsl:for-each/h3/xsl:value-of" x="213" y="71"/>
				<block path="div/div[4]/xsl:for-each/ul/xsl:for-each" x="173" y="71"/>
				<block path="div/div[4]/xsl:for-each/ul/xsl:for-each/li/a/xsl:attribute/xsl:value-of" x="13" y="31"/>
				<block path="div/div[4]/xsl:for-each/ul/xsl:for-each/li/a/xsl:value-of" x="13" y="71"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->