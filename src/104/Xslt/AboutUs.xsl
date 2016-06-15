<?xml version="1.0"?>
<!--Gorettis About Us -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<style type="text/css">
			ul {list-style-type:none}
			#AboutUsContainer {text-align:left;}
		</style>
		<div id="AboutUs">
			<h3>About Us</h3>
			<div id="AboutUsContainer">
				<div id="AboutUsImage">
					<img>
						<xsl:attribute name="src">
							##root##/Assets/<xsl:value-of select="ExpressLane/GenericChain/ChainID"/>/Images/gorettimomanddadgraphic.jpg
						</xsl:attribute>
					</img>
				</div>
				<div id="History">
					<p>How does a small family-run grocery business successfully compete with large supermarket chains?  According to Mark Goretti, <span class="quote">&#34;…by paying attention to the quality of their product, meeting the expectations of their customers, and keeping up with industry trends.&#34;</span></p>

					<p><span class="quote">&#34;My passion is food,&#34;</span> says Mark. <span class="quote">&#34;People come in all the time and tell me, &#39;oh, that was the best pot roast I've ever had,&#39; or, &#39;those strawberries were delicious.&#39; That’s what I love, and that's how we compete with the larger chains.&#34;</span></p>

					<p>The Goretti family tradition began in 1950 when Raymond Goretti purchased the Cherry Valley Market in Leicester. In 1966 Goretti purchased the Millbury Sentry Super. Over the next twenty years, Raymond worked hard and expanded the operation to include three additional locations in Worcester.</p>

					<p>When Raymond passed away in 1979, his wife Mary, with help from family members, took over management of the firm. In the early 1990's the company reorganized by selling off the Worcester locations and concentrating its efforts in the Millbury location. In 1998, the company moved into the second generation of ownership when Mark Goretti purchased the supermarket from remaining family members.</p>

					 <p><span class="quote">&#34;You can buy a can of corn anywhere, but here you can also get your meat custom cut… and be in and out of the store in a couple of minutes,&#34;</span> promises Mark. <span class="quote">&#34;Our niche is specialty cut meats, but our reputation is the relationship we have with our customers. When I can make someone happy by giving them a recipe, or sharing a cooking secret, boy, that’s satisfying.&#34;</span></p>

					<p><span class="quote">&#34;In my mind, there's still a place for a family-owned grocery business – because I'm here,&#34;</span> says Mark. <span class="quote">&#34;And people know I'm here. They don't hesitate to let me know when they like something, or when something goes wrong. I like that. They like that.&#34;</span></p>

					<p>But above all, Goretti says it's the employees that have made the difference: <span class="quote">&#34;They are by far the greatest asset of the company. It's our employees who come in everyday to work and create the warm and friendly atmosphere that makes us the 'community supermarket'.&#34;</span></p>

					<p>Mark and his wife Christine have three children Theresa, Anthony and Michael, who all work at the store part-time, extending a family tradition that is nearly 40 years old, and counting.</p>
				</div>
				<div id="ContactInformation">
						<h3>Store Information</h3><br/>
						<xsl:for-each select="ExpressLane/ArrayOfGenericStore/GenericStore">
							<b><xsl:value-of select="StoreName"/></b><br/>
							<xsl:value-of select="PrimaryAddress"/><br/>
							<xsl:value-of select="City"/><text>, </text><xsl:value-of select="Abbreviation"/>&#160;<xsl:value-of select="PostalCode"/><br/>
						<b>Phone: </b><xsl:value-of select="Phone"/><br/>
						<b>Fax: </b><xsl:value-of select="Fax"/><br/>
						<b>Store Hours: </b>Mon-Sat: 7am to 9pm, Sun: 9am to 7pm<br/>
						<b>E-mail: </b>
						<a>
							<xsl:attribute name="href">
								mailto:<xsl:value-of select="Email"/>
							</xsl:attribute>
							<xsl:value-of select="Email"/>
						</a><br/>
						</xsl:for-each>
				</div>
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