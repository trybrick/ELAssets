<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" />
	<xsl:template match="/">
		<div id="ProductRecalls" class="departmentPage">
			<h2>Product Recalls</h2>
			<div class="leftnav">
				<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
					<a>
						<xsl:attribute name="href"><xsl:value-of select="Image" /></xsl:attribute>
						<xsl:attribute name="target">_blank</xsl:attribute>
						<xsl:value-of select="Title" />
					</a>
				</xsl:for-each>
			</div>
			<div class="contentDiv">
				<p>Food safety is a priority for everyone at Trigs Foods. We maintain the highest standards in order to fulfill our commitment to customers like you that we mean business when it comes to food safety.<br /> 
				A food recall is a voluntary process initiated by a manufacturer or distributor to protect the public from products that may cause health problems or may be misbranded (incorrect labeling and/or packaging).</p>
				<p>As soon as a recall is announced by a manufacturer or the US Government, stores are alerted and affected product is removed from the shelf. We also have a process in place to block the sale of any Class I recalled product at the check-out to ensure that no Class I items that have been recalled are inadvertently sold to customers. We offer a full refund to customers who have any concern with a product they have purchased in our stores.</p> 
				<p>This website lists Class I and Class II recalls of products that are available in our stores.</p> 
				<p><strong>Class I</strong> - This is the most serious. Eating the food may cause health problems or even death.<br /><strong>Class II</strong> - This involves a potential health hazard where there is a remote probability of a health problem if the food is eaten.</p>
				<p>For further information on recalls:<br />
				Call the USDA Meat and Poultry Hotline 1-800-535-4555<br /> 
				Call the FDA Outreach and Information Center 1-888-723-3366.<br /> 
				Access these government websites:<br />
				<a href="http://www.fsis.usda.gov/Fsis_Recalls/" target="_blank">USDA Food Safety and Inspection Service</a><br />
				<a href="http://www.foodsafety.gov/" target="_blank">www.foodsafety.gov</a>
				</p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
