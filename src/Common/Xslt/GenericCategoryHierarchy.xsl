<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="ArrayOfGenericCategory" name="GenericCategoryList">
		<script type="text/javascript">
		<xsl:choose>	
			<xsl:when test="//GenericChain/ChainSettings/Setting[SettingID = 241]/Value = 'False'">
				var singleSelect = false;
			</xsl:when>
			<xsl:otherwise>
				var singleSelect = true;
			</xsl:otherwise>
		</xsl:choose>
		<![CDATA[
			function ShowHideChild(item, childID) {

				var childDiv = $(childID);

				if (singleSelect) {
					HideAllElements();
				}

				if (typeof(childDiv) == 'object') {

					if (childDiv.visible()) {
						HideAllChildren(childDiv);
					}
					else {
						ShowParents(childDiv);
					}

					if (typeof(refreshAdPods) == 'function') {
						refreshAdPods();
					}
				}

				DeselectAll();

				if (item != null) {
					item.className = 'activeCategory';
				}
			}

			function HideAllElements() {
				$$('.CategoryHierarchy div').each( function (e) { e.hide(); });
			}

			function ShowParents(div) {
				
				var element = $(div);

				while (element != null && element.className != 'CategoryHierarchy') {

					element.show();

					element = $(element.parentNode);
				}
			}

			function HideAllChildren(div) {
				
				if (typeof(div) == 'object') {
					
					div.hide();					

					var childDivs = div.getElementsByTagName('div');

					if (typeof(childDivs) == 'object') {
				
						for (var i = 0; i < childDivs.length; i++) {
							HideAllChildren(childDivs[i]);
						}
					}
				}
			}

			function RemoveHowToShopGraphic() {

				if ($('HowToShopImage') != null) {
					$('HowToShopImage').hide();
				}
			}

			function SetSelectedCategory(item, categoryID) {

				if (singleSelect) {
					HideAllElements();
					ShowParents(item);
				}

				SelectCategory(categoryID);

				DeselectAll();
				
				RemoveHowToShopGraphic();

				if (item != null) {
					
					item.className = 'activeCategory';
				}
			}

			function DeselectAll() {

				var categoryLinks = $$('.CategoryHierarchy a.activeCategory');

				for (var i = 0; i < categoryLinks.length; i++) {
					
					categoryLinks[i].className = '';
				}
			}
		]]>
		</script>
		
		<script type="text/javascript" src="/Assets/Common/Js/accordion.js" />
		<div class="CategoryHierarchy">
			<xsl:for-each select="GenericCategory[string-length(ParentCategoryID) = 0]">
				<xsl:sort select="CategoryName" data-type="text" />
				<xsl:call-template name="GenericCategoryListElement">
					<xsl:with-param name="Layer" select="'0'" />
				</xsl:call-template>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template match="GenericCategory" name="GenericCategoryListElement">
		<xsl:param name="CategoryID" select="CategoryID" />
		<xsl:param name="Name" />
		<xsl:param name="CategoryName" select="CategoryName" />
		<xsl:param name="ChildCategories" select="//GenericCategory[ParentCategoryID = $CategoryID]" />
		<xsl:param name="Layer" />
		<xsl:choose>
			<xsl:when test="count($ChildCategories) = 1">
				<xsl:for-each select="$ChildCategories[position() = 1]">
					<xsl:choose>
						<xsl:when test="string-length($Name) &gt; 0">
							<xsl:call-template name="GenericCategoryListElement">
								<xsl:with-param name="Layer" select="$Layer" />
								<xsl:with-param name="Name" select="$Name" />
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="GenericCategoryListElement">
								<xsl:with-param name="Layer" select="$Layer" />
								<xsl:with-param name="Name" select="$CategoryName" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<a>
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="count($ChildCategories) &gt; 1">
								<xsl:text>javascript:void();</xsl:text>
							</xsl:when>
							<xsl:otherwise>#</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="onclick">
						<xsl:choose>
							<xsl:when test="count($ChildCategories) &gt; 1">
								<xsl:value-of select="concat('ShowHideChild(this, &quot;ChildCategories:', $CategoryID, '&quot;);')" /> 
							</xsl:when>
							<xsl:when test="count($ChildCategories) = 1">
								<xsl:value-of select="concat('SetSelectedCategory(this, ', $ChildCategories[position() = 1]/CategoryID, ');')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('SetSelectedCategory(this, ', $CategoryID, ');')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="string-length($Name) &gt; 0">
							<xsl:value-of select="$Name" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$CategoryName" />
						</xsl:otherwise>
					</xsl:choose>
				</a><br />
				<xsl:if test="count($ChildCategories) &gt; 1">
					<div style="display:none;">
						<xsl:attribute name="id">
							<xsl:value-of select="concat('ChildCategories:', $CategoryID)" />
						</xsl:attribute>
						<xsl:attribute name="class">
							<xsl:value-of select="concat('Layer', $Layer)" />
						</xsl:attribute>
						<xsl:for-each select="$ChildCategories">
							<xsl:sort select="CategoryName" data-type="text" />
							<xsl:call-template name="GenericCategoryListElement">
								<xsl:with-param name="Layer" select="$Layer + 1" />
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\43\XmlData\43-PageTypeId-106-InventoryPage.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth=""
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