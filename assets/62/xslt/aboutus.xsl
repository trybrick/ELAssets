<?xml version="1.0"?>
<!--Ted's IGA About Us -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">

    <!-- 
	key=ABQIAAAA37KQYs4oleyLms9DHRzXFBSK1xBN369RZon6iGGy82C1DOOL-RRjPpw9FDd6Sq3vBaNdtUty2ydfxA
	-->
    <div id="AboutUs">
		<div id="StoreInformation" style="float:left;clear:both;width:100%;">
          <h3>Store Information</h3>
          <div style="float:left;">
          <xsl:for-each select="ExpressLane/Common/ArrayOfGenericStore/GenericStore">
            <strong><xsl:value-of select="StoreName"/></strong><br/>
            <xsl:value-of select="PrimaryAddress"/><br/>
            <xsl:value-of select="City"/><text>, </text><xsl:value-of select="Abbreviation"/>&#160;<xsl:value-of select="PostalCode"/><br/>
            <strong>Phone: </strong><xsl:value-of select="Phone"/><br/>
            <strong>Fax: </strong><xsl:value-of select="Fax"/><br/>
            <strong>Store Hours: </strong>
            <ul>
              <li>Monday-Thursday 8:00am - 8:00pm</li>
              <li>Friday 8:00am - 8:30pm</li>
              <li>Saturday 8:00am - 8:00pm</li>
              <li>Sunday 8:00am - 6:00pm</li>
            </ul>
          </xsl:for-each>
		  <a>
			<xsl:attribute name="href">##root##/StoreLocator.aspx?hold=1</xsl:attribute>
			Store Location Map
		  </a>
		  </div>
		   <img style="float:left;margin-left:20px">
            <xsl:attribute name="src">
              ##root##/Assets/##chainid##/Images/tedsiga_store.jpg
            </xsl:attribute>
          </img>
		</div>         
        <div id="History" style="float:left;clear:both;width:100%;">
		<h3>About Us</h3>
        <p>We welcome you to experience the Ted's Difference, and as we say,  <span class="quote">&#34;Let our family take care of your family.&#34;</span><br/>
        Ted's Supermarket opened its doors in February 1973 to Hebron and the surrounding Communities. Ted Armata with his two sons, Todge and David have grown the business into a cornerstone of the community. Over the past 27 years Ted's has seen many changes in the needs of their customers, with two major expansions Ted's has met this need with it's 22,000 sq. ft. store. Ted's has been a major supporter of the community, with a long list of charitable organizations that have received their support.</p>
		<p>At Ted's we dedicate ourselves to excellence in providing:
			<ul>
              <li>
                <b>Quality products and freshness you can trust</b>
              </li>
              <li>
                <b>Friendly, efficient, courteous service</b>
              </li>
              <li>
                <b>A clean neighborhood atmosphere in which to shop</b>
              </li>
              <li>
                <b>Guaranteed satisfaction on every purchase</b>
              </li>
            </ul>
		</p>
          <p>As a member of the IGA family, our buying power ensures you of competitive pricing, great specials and extraordinary quality. Ted's quality has always been the top priority of our business. From our USDA beef to our Grade A all natural chicken, Ted's Meat Department is a cut above the rest. We carry a large variety of the freshest fruits and vegetables from around the world that includes over thirty organic items. Our Deli Department carries only the best names in luncheon meats and cheeses that are sliced to order. Our salads are freshly made in our kitchen to ensure quality. Our breads and rolls are baked fresh everyday and our custom cakes are the talk of the town.<br/>As an independently owned supermarket, Ted's has always been a leader with technological advances in the industry. From our introduction of scanning registers in 1979 to provide fast, accurate checkout to our latest introduction of electronic price tags makes Ted's a leader in the industry.</p>
        </div>
	</div>
  </xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios/>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->