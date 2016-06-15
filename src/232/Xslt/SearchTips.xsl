<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
		<script type="text/javascript">
			<xsl:comment>
				<![CDATA[
				var pages = 6;
				function elemOn(elem_id){
					if(document.getElementById(elem_id))
						document.getElementById(elem_id).style.display = "block";
				}
				function elemOff(elem_id){
					if(document.getElementById(elem_id))
						document.getElementById(elem_id).style.display = "none";
				}
				function hideAll(){
					for( var i = 1; i <= pages; i++ )
						elemOff( 'div'+i );
				}
				function showAll(){
					for( var i = 1; i <= pages; i++ )
						elemOn( 'div'+i );
				}
				function showOne(elem_id){
					hideAll( );
					elemOn( elem_id );
				}
				]]>
			</xsl:comment>
		</script>
<div id="SearchTips">
	<div id="SearchTipsHeader">
		<h2>Welcome to <xsl:value-of select="ExpressLane/Common/Chain/ChainName" /> Online Shopping!</h2>
	</div>
	<div id="HelpTopics">
		<h3>Help Topics:</h3>
		<ul>
			<li><a href="#" onclick="showOne('div1');">Registration</a></li>
			<li><a href="#" onclick="showOne('div2');">Shopping</a></li>
			<li><a href="#" onclick="showOne('div3');">Filling your Cart</a></li>
			<li><a href="#" onclick="showOne('div4');">Check Out</a></li>
			<li><a href="#" onclick="showOne('div5');">Your Order</a></li>
			<li><a href="#" onclick="showOne('div6');">Trouble Signing In?</a></li>
		</ul>
        <br/>
		<a class="button"><xsl:attribute name="href"><xsl:value-of select="//GenericChain/PreferedHost"/></xsl:attribute><span>Back to Home</span></a>
	</div>
	<div id="SearchTipsContent">
		<div class="SearchTipsSubject" id="div1" style="display:block;">
		<h3 class="SearchTipsSubjectHeading" id="Registration">Registration</h3>
		<p>
			Complete your online grocery order by clicking the "Sign-In" button at the top of this page.</p> <p>Not a member? It's easy to sign-up.</p><p> After you've completed the registration form, sign-in with your new username or email and password.</p>
		</div>
		<div class="SearchTipsSubject" id="div2" style="display:none;">
			<h3 class="SearchTipsSubjectHeading" id="Shopping">Shopping</h3>
			<p>After logging in, there are several easy ways to find an item:
						</p>
						<ul>
							<li>
								<p><strong>Shop By</strong> Department, Aisle or Category.</p>
							</li> 
							<li>
								<p><strong>Quick Search</strong> by brand name, product description or keyword.</p>
							</li>
							<li>
								<p><strong>Select the &quot;Previous Orders&quot;</strong> tab to view your order history.</p>		
							</li>
							<li>
								<p><strong>Select the &quot;Items On Sale&quot;</strong> tab to view/add items directly to your cart. </p>		
							</li>  
							<li>
								<p><strong>Select the &quot;Saved Carts&quot;</strong> tab to view/add items from previously saved carts.</p> 
							</li>
							<li>
								<p><strong>Select the &quot;Things I Buy&quot;</strong> tab to view/add items previously purchased.</p>
							</li>
						</ul>
		</div>
		<div class="SearchTipsSubject" id="div3" style="display:none;">
			<h3 class="SearchTipsSubjectHeading" id="FillingCart">Filling your Cart</h3>
			<p>Your cart holds the items you've chosen until you're ready to checkout.</p><p> Items can be added to your cart by clicking on the "Add" button.</p><p> If you wish to remove an item, select the item and click on the &quot;Remove&quot; button.</p><p> If you log-out before you're finished shopping your items will be saved in your cart when you return.</p>
		</div>
		<div class="SearchTipsSubject" id="div4" style="display:none;">
			<h3>Check Out</h3>
			<h4>Click the "Checkout" button when you're finished with your list.</h4>
			<ol>
                <li><strong>Verify</strong> your correct delivery address.</li> 
                <li><strong>Select</strong> &quot;Delivery Options:&quot; and &quot;Substitution Preferences&quot;.</li> 
                <li><strong>Review</strong> your &quot;Order Confirmation&quot; and cart total.</li> 
                <li><strong>Enter</strong> payment (Visa, Master Card, Discover, American Express or JCB), billing and shipping information.</li> 
                <li><strong>Click</strong> on the &quot;Submit&quot; button to place your order.</li>
            </ol>
			<p>Your order will be sent to be fulfilled. You will also receive a confirmation email shortly after placing your order.</p>
			<p><strong>Note:</strong> Once your order has been placed, no changes can be made without contacting the store
			directly.</p>
		</div>
		<div class="SearchTipsSubject" id="div5" style="display:none;">
			<h3>Your Order</h3>
			<h4>If there is a wrong or missing item in your order please contact your store. They will work with you to correct any errors.</h4>
			<h4>Pricing Policy</h4>
			<p>We strive to ensure the prices you see while shopping online are the same prices in our store.</p><p>To ensure that you receive the current week's prices, you should schedule your pick-up no later than Thursday of the current week.</p><p>Your estimated shopping total does not include sales tax, bottle deposits (where applicable) and service fee. Your final receipt will reflect actual charges for weighted perishable products and our current in-store pricing.</p>
			<h4>Random Weight Items</h4>
			<p>Your totals may differ due to items ordered by weight. Items sold by the
pound will vary within their given weight ranges.</p><p>When you receive your
product you will only be charged the per pound price for the actual weight
of the item. To assist you during shopping, the product
descriptions will always list the price per pound for an item.</p>
		</div>
		<div class="SearchTipsSubject" id="div6" style="display:none;">
			<h3>Trouble Signing In?</h3>
			<h4>Try These Tips:</h4>
			<ol>
							<li><p>Please double-check that you are using the correct username and
			password. Our password and email fields are <em>case-sensitive</em>.</p></li>
						<li><p>If you have forgotten your password enter your email address and select
							the &quot;forgotten password&quot; checkbox. Your password will be emailed to
							you.</p></li>
					<li><p>Our website requires a JavaScript enabled browser. JavaScript must be enabled for you to shop online</p></li>
					<li><p>If you are still experiencing difficulties, please contact Customer Service by clicking on
						the &quot;Contact Us&quot; tab</p></li></ol>
						</div>
					</div>
				</div>
				</xsl:template>
				</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

				<metaInformation>
					<scenarios/>
					<MapperMetaTag>
						<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
						<MapperBlockPosition></MapperBlockPosition>
						<TemplateContext></TemplateContext>
						<MapperFilter side="source"></MapperFilter>
					</MapperMetaTag>
				</metaInformation>
				--><!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

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