<?xml version='1.0' encoding='utf-8'?><!-- DWXMLSource="file:///Trogdor/Users/pat/Desktop/xml/emailwithdynamiccontent.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>


<xsl:template match="/"><style>
		.JoinRegisterVisit	{color:##FF0000; font-size:18px;}
	</style>

	

       <table width="820px" border="0" cellspacing="0" cellpadding="10">
         <tr valign="top">
           
          <td>

		  
		  <!--content start-->
		  
		  <img src="/Assets/Common/Images/upromiseheader.jpg" />
		  
		  <h2>Turn your grocery shopping into money for college with Upromise<sup style="font-size:11px;">&#174;</sup> <br/>and <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> Stores</h2>
		  
		  <p>Upromise is a free service that's helping make college more affordable to millions of families. How? Upromise helps members get money for college on the stuff they buy everyday, including thousands of participating grocery items you'll find right here at <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/>.</p>
		  
		  <h3>Here's how:</h3>

		  
		  <table width="820px" border="0" cellspacing="0" cellpadding="5">
			  <tr valign="center">
				  <td width="40"><img src="/Assets/Common/Images/1.jpg" /></td>
				  <td><span class="JoinRegisterVisit">Join Upromise</span> for FREE at 
				<a><xsl:attribute name="href">http://www.upromise.com/8292.do?sx=groc%26bannerId=AHOLDX001B0004%26ax=giantpa-gsn</xsl:attribute>upromise.com</a>.</td>
			  </tr>
			  
			  <tr valign="top">

				  <td width="40"><img src="/Assets/Common/Images/2.jpg" /></td>
				  <td><span class="JoinRegisterVisit">Register</span> your <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> Preferred Shoppers Club card number when prompted while enrolling in Upromise. If you're already a Upromise member go to <a><xsl:attribute name="href">http://www.upromise.com/8292.do?sx=groc%26bannerId=AHOLDX001B0004%26ax=giantpa-gsn</xsl:attribute>upromise.com</a> and click the "Register your cards now" link. If you don't have a <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> Preferred Shoppers Club card, visit your local <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> store to get one.
				  </td>
			  </tr>

			  
			    <tr valign="center">
				  <td width="40"><img src="/Assets/Common/Images/3.jpg" /></td>
				  <td><span class="JoinRegisterVisit">Visit</span> your local <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> and purchase participating products. A complete list 
is <a href="http://www.upromise.com/marketplace/printShoppingList.html" target="_blank">available here</a>.</td>
			  </tr>
			 
			 
			  <tr valign="center">
				  <td width="40"><img src="/Assets/Common/Images/3.jpg" /></td>

				  <td><span class="JoinRegisterVisit">Present</span>  your registered <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> Preferred Shoppers Club card to the cashier at checkout and your savings will automatically be added to your Upromise account.</td>
			  </tr> 

		  </table>
		  
		  <br />
		  
		  <h3>You can get money for college on thousands of items.</h3>
		  
		  <p>Thousands of grocery items from leading brands like these give money back for college</p>
		  
		 <table width="600" border="0" cellspacing="0" cellpadding="10" style="margin-left:120px;">

         
		 <tr valign="top">
		 
		 <td><img src="/Assets/Common/Images/nestle.jpg" /></td>
		 <td><img src="/Assets/Common/Images/brachs.jpg" /></td>
		 <td><img src="/Assets/Common/Images/enfamil.jpg" /></td>
		 <td><img src="/Assets/Common/Images/elmers.jpg" /></td>
		 <td><img src="/Assets/Common/Images/tylenol.jpg" /></td>
		 
		 </tr>
		 
		 <tr valign="top">
		 
		 <td><img src="/Assets/Common/Images/lysol.jpg" /></td>

		 <td><img src="/Assets/Common/Images/snyders.jpg" /></td>
		 <td><img src="/Assets/Common/Images/beechnut.jpg" /></td>
		 <td><img src="/Assets/Common/Images/floridasnatural.jpg" /></td>
		 <td><img src="/Assets/Common/Images/hefty.jpg" /></td>
		 
		 </tr>
		 		 
		 </table>
		  
		  
		   <h3>Groceries and so much more.</h3>
		   
		   <p>As a Upromise member, you can get money for college on your everyday spending-when you fill your tank, shop online, book travel, eat out, you name it.  Just look at some of the other ways you can get Upromise college savings:</p>

		   
<ul style="list-style:circle;">
<li>550+ leading online retailers like Lands' End, Circuit City<sup style="font-size:10px;">&#174;</sup> and gap.com, and travel 
partners like Southwest Airlines Vacations<sup style="font-size:10px;">&#174;</sup>.  You can get 1%-25% savings when you start shopping at Upromise.</li>

<li>40,000 retail stores and service locations like Bed Bath &amp; Beyond<sup style="font-size:10px;">&#174;</sup>, Eddie Bauer<sup style="font-size:10px;">&#174;</sup>, GNC<sup style="font-size:10px;">&#174;</sup>, Avis<sup style="font-size:10px;">&#174;</sup>, Exxon and Mobil</li>

<li>8,000 participating restaurants, where you can get up to 8% savings</li>
</ul>

<p>So give your college savings a boost.  Join Upromise and register your <xsl:value-of select="ExpressLane/Common/Chain/ChainName"/> card today!</p>

<p>Terms and Conditions apply for each company's contributions. Go to <a><xsl:attribute name="href">http://www.upromise.com/8292.do?sx=groc%26bannerId=AHOLDX001B0004%26ax=giantpa-gsn</xsl:attribute>upromise.com</a> to learn more</p>

		  
		  <!--content end-->
		
          </td>
         </tr>
       </table>

</xsl:template>
</xsl:stylesheet>