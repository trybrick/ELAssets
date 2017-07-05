<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<style>
			body
			{
				background-color: #ecf0f1;
				color: #8f9192;
				font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
				font-size: 13px; 
			}
			html
			{
				background-color: #ecf0f1;
			}
			p, li
			{
				color: #8f9192;
				font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
				font-size: 13px;
			}
			h2
			{
				border: none;
				color: #569bd4;
				font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
				font-weight: normal;
				margin: 0 0 -15px;
				padding: 15px;
			}
			h4
			{
				color: #008265;
				font-weight: normal;
				margin: 0;
			}
			a:link, a:visited, a:active, a:hover
			{
				color: #8f9192;
				font-weight: normal;
			}
			#StoreHeader
			{
				display: none;
			}
			#container
			{
				padding: 0;
				width: 910px;
			}
			#corpHeader
			{
				background: url(https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/headerBG.png);
				height: 87px;
				margin-bottom: 30px;
			}
			.corpLogo
			{
				padding: 16px 40px;
			}
			.logBtn
			{
				float: right;
				margin: -63px -68px;
				*margin: -76px -68px; /*IE7 hack*/
			}
			.links
			{
				margin: -76px 16px;
			}
			.quickLinks
			{
    			list-style:none;
    			font-weight:bold;
    			margin-bottom:10px;
    			float:right;
			}
			.quickLinks li
			{
    			float:left;
    			margin-right:10px;
    			position:relative;
    			font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
			}
			.quickLinks a
			{
    			display:block;
    			padding:5px;
    			color:#fff;
    			text-decoration:none;
			}
			.quickLinks a:hover
			{
    			color:#fff;
    			text-decoration:underline;
			}

			/*--- DROPDOWN ---*/
			.quickLinks ul
			{
    			background:#fff;
    			background:rgba(255,255,255,0);
    			list-style:none;
    			position:absolute;
    			left:-9999px;
    			background-image: url(https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/quickLinksTop3.png); background-repeat: no-repeat;
    			height: 663px;
    			padding: 0 32px;
			}
			.quickLinks ul li
			{
				padding-top:1px;
    			float:none;
    			margin: 27px 0 -29px;
			}
			.quickLinks ul a
			{
    			white-space:nowrap;
			}
			.quickLinks li:hover ul
			{ /* Display the dropdown on hover */
    			left:25px;
    			top: -35px;
    			width: 100%
			}
			.quickLinks li:hover a
			{ 
    			text-decoration:underline;
			}
			.quickLinks li:hover ul a
			{ 
    			text-decoration:none;
			}	
			.quickLinks li:hover ul li a:hover
			{ 
    			background:#1c4177;
    			width: 60%;
    			border-radius: 5px;
			}
			.quickLinks a, p
			{
				color: #ffffff;
				font-size: 11px;
				font-weight: normal;
			}
			.quickLinks h4
			{
				color: #ffffff;
				font-size: 11px;
				font-weight: bold;
			}
			#corpContent
			{
				font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
				width: 100%;
				min-height: 568px;
				height: 100%;
			}
			#corpContent li
			{
				list-style-type: none;
				padding: 5px;
			}
			.corpButton
			{
				margin: 0 -6px;
				padding: 10px;
			}
			#utility
			{
				background: url(https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/utilityHeader.png) no-repeat scroll 0 0;
				background-color: #ecf0f1;
				border-radius: 10px;
				margin-left: 40px;
				width: 234px;
			}
			#corpFooter
			{
				background-color: #dfeeeb;
				height: 100px;
				margin: 10px 0;
			}
			.tutorials
			{
				float: left;
				width: 50%;
			}
			.tutorials img
			{
				width: 375px;
				height: 60px;
			}
			.tutorials li
			{
				list-style-type: none;
			}
			.videos
			{
				float: left;
				width: 50%;
			}
			.videos img
			{
				width: 375px;
				height: 60px;
			}
			.videos li
			{
				list-style-type: none;
			}
			#corpFooter li
			{
				height: 100px;
				list-style-type: none;
			}
			.rowLogos
			{
				margin: -25px -10px;
			}
			.rowLogos li
			{
				float: left;
				padding: 0 28px;
			}

			.rowLogos img
			{
				margin:43px 0;
			}
			ul li p
			{
				margin: 0;
			}
			#GsnFooter 
			{
    			background-color: #dfeeeb;
    			height: 29px;
    			margin: -26px 0;
    			width: 910px;
			}

		
		</style>
		<div id="corpHeader">
			<a href="/ess.aspx">
			<img class="corpLogo" src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/oneRoundysLogo.png" />
			</a>
			
			<ul class="quickLinks">
    
    <li>
        
            <img class="links" src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/btn_quickLinks.png" />
        
        <ul>
            <li>
                <a href="https://wwwrs.massmutual.com/journey/Login.aspx" target="_blank">
                    <h4>401(k) Account</h4>
                    <p>Mass Mutual 800-743-5274</p>
                </a>
            </li>
            <li>
                <a href="http://www.healthequity.com/" target="_blank">
                    <h4>Health Savings Plan</h4>
                    <p>Health Equity 877-291-1930</p>
                </a>
            </li>
            <li>
                <a href="https://www.anthem.com/health-insurance/home/overview" target="_blank">
                    <h4>Health Care Coverage Medical</h4>
                    <p>Anthem 800-843-6447</p>
                </a>
            </li>
            <li>
            	<a href=" http://www.anthem.com/mydentalvision" target="_blank">
					<h4>Dental/Vision</h4>
					<p>Anthem</p>
					<p>877-567-1805 dental</p>
					<p>866-723-0515 vision</p>
				</a>
			</li>
			<li>
				<a href="https://www.express-scripts.com/" target="_blank">
					<h4>Prescriptions</h4>
					<p>Express Scripts 866-310-0235</p>
				</a>
			</li>
            <li>
            	<a href="http://www.mylifematters.com/" target="_blank">
					<h4>Employee Assistance Plan</h4>
					<p>Life Matters 800-634-6433</p>
				</a>
			</li>
            <li>
            	<a href="http://www.aetna.com/" target="_blank">
					<h4>Hourly Short-Term Disability</h4>
					<p>Aetna 866-326-1380</p>
				</a>
			</li>
			<li>
				<a href="http://www.libertymutual.com/" target="_blank">
					<h4>Long-Term Disability</h4>
					<p>Liberty Mutual 800-838-5290</p>
				</a>
			</li>
            <li>
            	<a href="http://unum.mkt2189.com/roundys_enrollment/" target="_blank">
					<h4>Voluntary Benefit Products</h4>
					<p>Mercer 855-889-7097</p>
				</a>
			</li>
			<li>
				<a href="https://www.cccverify.com/" target="_blank">
					<h4>Employment/Income Verification</h4>
					<p>CCC 855-901-3099</p>
				</a>
			</li>
			<li>
				<a href="http://www.healthequity.com/" target="_blank">
					<h4>Flexible Spending Accounts</h4>
					<p>Health Equity 877-291-1930</p>
				</a>
			</li>
        </ul>
    </li>
    
</ul>
<a href="https://reset-self-service.roundys.com/">
				<img class="logBtn" src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/btn_password_2.png" />
			</a>
		</div>
		<div id="corpContent">
		<p>
			<iframe width="100%" scrolling="auto" height="1800px" frameborder="0" src="https://www2.apply2jobs.com/Roundys/index.cfm?fuseaction=main.hvicc" id="widget"></iframe>
			</p>
		</div>
		
		<div id="corpFooter">
			
			<div class="rowLogos">
				<ul>
					<li>
						<a href="http://www.roundys.com/Home.gsn" target="_blank">
							<img src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/roundyLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.marianos.com/" target="_blank">
							<img src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/marianosLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.picknsave.com/" target="_blank">	
							<img src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/pcknsaveLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.copps.com/" target="_blank">	
							<img src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/coppsLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.rainbowfoods.com/" target="_blank">
							<img src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/rainbowLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.metromarket.net/" target="_blank">
							<img src="https://upload.brickinc.net/elvs/staticcontent/uploadfiles/225/metromarketLogo.png" />
						</a>	
					</li>
				</ul>
			</div>
		</div>
		
	</xsl:template>
</xsl:stylesheet>
