<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<div id="AboutUs">
			<img>
				<xsl:attribute name="src">
					##root##/Assets/27/Images/HeaderLogo.gif
				</xsl:attribute>
			</img>
			<div id="Information">
				<div id="StoreA">
					<table cellspacing="0" cellpadding="0">
						<tbody>
							<tr><td>2969 Jackson St, Paducah, KY 42001</td></tr>
							<tr><td><b>Phone: </b>270-443-6219</td></tr>
							<tr><td><b>Email: </b><a href="mailto:customerservice@supervalupaducah.com">customerservice@supervalupaducah.com</a></td></tr>
							<tr><td><b>Click here for </b><a href="http://maps.google.com/maps?f=q&amp;hl=en&amp;q=2929+Jackson+st+paducah+ky+42001&amp;btnG=Search+" target="_blank" alt="">Google Map</a></td></tr>
						</tbody>
					</table>
				</div>
				<div id="StoreB">
					<table cellspacing="0" cellpadding="0">
						<tbody>
							<tr><td>2855 Lone Oak Rd,  Paducah, KY 42001</td></tr>
							<tr><td><b>Phone: </b>270-554-0087</td></tr>
							<tr><td><b>Email: </b><a href="mailto:customerservice@supervalupaducah.com">customerservice@supervalupaducah.com</a></td></tr>
							<tr><td><b>Click here for </b><a href="http://maps.google.com/maps?f=q&amp;hl=en&amp;q=2855+lone+st+oak+rd+paducah+ky+42001&amp;btnG=Search+" target="_blank" alt="">Google Map</a></td></tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>