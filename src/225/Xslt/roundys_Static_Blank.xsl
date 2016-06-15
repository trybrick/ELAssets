<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<link rel="stylesheet" href="Styles/protoshow.css" media="screen" />
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/scriptaculous/1.8.3/scriptaculous.js"></script>
        <script type="text/javascript" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/protoshow.js"></script>
        <script type="text/javascript" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/site.js"></script>
		<style>
			body
			{
				background-color: #ecf0f1;
				color: #8f9192;
				font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;;
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
			h2, h3
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
				color: #008265;
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
				background: url(http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/headerBG.png);
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
    			z-index: 125;
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
    			background-image: url(http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/quickLinksTop3.png); background-repeat: no-repeat;
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
				clear: both;
				float: right;
				margin-right: 30px;
				width: 590px;
			}
			#corpContent p
			{
				color: #8f9192;
				font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
				font-size: 13px;
				margin: 0;
			}
			#corpContent li
			{
				font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
				line-height: 23px;
			}
			.tutorials
			{
				margin: 25px 0;
			}
			.corpButton
			{
				margin: 0 -6px;
				padding: 10px;
			}
			#corpColumn
			{
				float: left:
				width: 300px;
			}
			#corpColumn h1
			{
				color: #569bd4;
				font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
				font-weight: normal;
				padding: 0 20px;
			}
			#utility
			{
				background-color: #ecf0f1;
				border-radius: 10px;
				float: left;
				margin-left: 40px;
				width: 234px;
			}
			#utility ul
			{
				margin: -6px;			
			}
			.divide
			{
				padding: 0 14px;
			}
			#corpFooter
			{
				background-color: #dfeeeb;
				float: left;
				height: 100px;
				margin: 20px 0;
    			padding: 0 21px;
			}
			#corpFooter li
			{
				height: 100px;
				list-style-type: none;
			}
			.rowLogos
			{
				margin: 0 auto;
			}

			.rowLogos li
			{
				float: left;
				margin-top: -20px;
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
			<img class="corpLogo" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/oneRoundysLogo.png" />
			
			<ul class="quickLinks">
    
    <li>
        
            <img class="links" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_quickLinks.png" />
        
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
				<img class="logBtn" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_password_2.png" />
			</a>
		</div>
		<div id="corpContent">
			<div id="myshow1" class="protoshow">
			<ul class="show">
				<li class="slide" data-slide-interval=""><img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/ess.png" alt="" /></li>
				<li class="slidePane" data-slide-interval=""><img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/slideOne.png" alt="" /></li>
				<li class="slide" data-slide-interval=""><img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/ess.png" alt="" /></li>
				<li class="slide" data-slide-interval=""><img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/slideOne.png" alt="" /></li>
			</ul>
		</div>

			<h2>Welcome to Employee Self-Service</h2>
			<p>Employee Self-Service (ESS) is a convenient, secure and user-friendly resource accessed online through the OneRoundy’s portal. It will not only enable you to see your individual records, but also provide tools to give you more control of your personal information.</p>
			<br />
			<p>Anyone wanting to access the OneRoundy’s portal and ESS page must:</p>
			<ul>
				<li>Have a valid Roundy’s username (Employee ID #) and password. Click <a href="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/getting started with employee self service.pdf" target="_blank">here</a> for instructions to create your password.</li>
				<li>Meet basic browser and system requirements</li>
			</ul>
			<a href="/tutorials.aspx">
				<img class="tutorials" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_tutorials.png" />
			</a>

			<h2>Accessing Employee Self-Service</h2>
			<ol>
				<li>Click on the self-service option you need on the left panel</li>
				<li>On the next screen, you’ll be asked for your username and password</li>
				<li>Follow the instructions on the screen to complete your request or update</li>
			</ol>

			<h3>Manage My Password</h3>
			<p>If you forgot your password or would like to change it, click Manage My Password at the top of the page.</p>

			<h3>Accessing Quick Links &amp; Contacts</h3>
			<p>Click on the Quick Links &amp; Contacts button at the top of the page for phone numbers and websites for our insurance products, 401(k), and other employee benefits.</p>
		</div>


		<div id="corpColumn">
			<div id="utility">
				<h1>Personal Information</h1>
				<ul>
					<li>Home and Mailing Address</li>
					<li>Personal Information Summary</li>
					<li>Phone Numbers</li>
					<li>Email Address</li>
					<li>Emergency Contacts</li>
					<li>Roundy's Reward Card</li>
				</ul>
					<a href="https://employees.roundys.com/psp/pshrprd/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=HC_PERSONAL_INFO_ESS&amp;FolderPath=PORTAL_ROOT_OBJECT.CO_EMPLOYEE_SELF_SERVICE.HC_PERSONAL_INFO_ESS&amp;IsFolder=true">
						<img class="corpButton" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_personalInfo.png" />
					</a>
					<img alt="start new section" class="divide" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/divider.png" />
				<h1>Benefits</h1>
				<ul>
					<li>Dependents and Beneficiaries</li>
					<li>Benefits Summary</li>
					<li>Savings Contribution Summary</li>
					<li>Insurance Summary</li>
					<li>Benefits Enrollment</li>
				</ul>
				<a href="https://employees.roundys.com/psp/pshrprd/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=HC_BENEFITS_ESS&amp;FolderPath=PORTAL_ROOT_OBJECT.CO_EMPLOYEE_SELF_SERVICE.HC_BENEFITS_ESS&amp;IsFolder=true">
						<img class="corpButton" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_benefits.png" />
				</a>
				<img alt="start new section" class="divide" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/divider.png" />
				<h1>Payroll</h1>
				<ul>
					<li>View Paycheck</li>
					<li>Direct Deposit</li>
					<li>W-4 Tax Information</li>
					<li>State Tax Information</li>
					<li>W-2 Reissue Request</li>
					<li>Earnings Summary</li>
				</ul>
				<a href="https://employees.roundys.com/psp/pshrprd/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=HC_PAYROLL_COMP&amp;FolderPath=PORTAL_ROOT_OBJECT.CO_EMPLOYEE_SELF_SERVICE.HC_PAYROLL_COMP&amp;IsFolder=true">
						<img class="corpButton" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_payroll.png" />
				</a>
				<img alt="start new section" class="divide" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/divider.png" />
				<h1>Timekeeping &amp; Scheduling</h1>
				<ul>
					<li>My Timecard</li>
					<li>My Reports</li>
					<li>My Requests</li>
				</ul>
				<a href="https://workforceess.roundys.com/">
						<img class="corpButton" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_timeSchedule.png" />
				</a>
				<img alt="start new section" class="divide" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/divider.png" />
				<h1>Newsletters</h1>
				<ul>
					<li>Own Brand Newsletter</li>
				</ul>
				<a href="/Newsletters.aspx">
						<img class="corpButton" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_newsletters.png" />
				</a>
				<img alt="start new section" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/divider.png" />
				<!--<h1>Career Center</h1>
				<ul>
					<li>List of Available Positions</li>
					<li>Internal Application</li>
				</ul>
				<a href="#">
						<img class="corpButton" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_careerCenter.png" />
				</a>-->
			</div>
		</div>
		
		
		<div id="corpFooter">
			
			<div class="rowLogos">
				<ul>
					<li>
						<a href="http://www.roundys.com/Home.gsn" target="_blank">
							<img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/roundyLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.marianos.com/" target="_blank">
							<img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/marianosLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.picknsave.com/" target="_blank">	
							<img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/pcknsaveLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.copps.com/" target="_blank">	
							<img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/coppsLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.rainbowfoods.com/" target="_blank">
							<img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/rainbowLogo.png" />
						</a>	
					</li>
					<li>
						<a href="http://www.metromarket.net/" target="_blank">
							<img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/metromarketLogo.png" />
						</a>	
					</li>
				</ul>
			</div>
		</div>
		<style>
			/* ####################################### */
/* ########### STANDARD SETUP ############ */
/* ####################################### */

.protoshow,
.protoshow .show {
	position: relative;
	margin: 0;
	padding: 0;
	list-style: none;
	height: 300px;
}

.slide {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 90;
	height: 100%;
}

.active-slide {
	z-index: 100;
}

.protoshow .slide-caption {
	position: absolute;
	left: 0;
	bottom: 0;
	right: 0;
	z-index: 100;
	padding: 1em 10px;
	background-color: #000;
	background-color: rgba(0,0,0,.4);
	color:#fff;
}

.proto-progress-timer {
	position: absolute;
	top: 7px;
	right: 7px;
	z-index: 9999;
}


/* TRANSITION SLIDE
------------------------------------------------*/

.transition-slide .show-window {
	overflow: hidden;
	position: relative;
}

.transition-slide .show {
	position: absolute;
	top: 0;
	left: 0;
	width: 999999px;
}

.transition-slide .slide {
	position: static; /*overide*/
	float: left;
	display: block;
}


/* PROTO CONTROLS
------------------------------------------------*/

.proto-controls,
.proto-navigation {
	margin: 0;
	padding: 0;
	list-style: none;
}

.proto-controls a:link,
.proto-controls a:visited,
.proto-navigation a:link,
.proto-navigation a:visited {
	display: block;
	text-indent: -9999px;
	overflow: hidden;
}

.proto-controls li {
	position: absolute;
	top: 50%;
	margin-top: -36px;
	left: 10px;
	width: 10%;
	height: 100%;
	z-index: 110;
}

.proto-controls .forward {
	right: 10px;
	left: auto;
}

.proto-controls a {
	width: 100%;
	height: 61px;
	background: url(/img/proto_controls_bg.png) no-repeat 0 0;
	opacity: 0.2;
	-moz-opacity: 0.2;
	filter:alpha(opacity=20);
}

.proto-controls a:hover,
.proto-controls a:focus {
	opacity: 1;
	-moz-opacity: 1;
	filter:alpha(opacity=100);
}

.proto-controls .forward a {
	background-position: 100% -90px;
}


/* PROTO NAVIGATION
------------------------------------------------*/

.proto-navigation {
	position: absolute;
  	top: 0;
    right: 50%;
    float: right;
    z-index: 120;
}

.proto-navigation li {
    float: left;
    left: 50%;
    padding: 12px 6px;
    position: relative;

}

.proto-navigation a {
	background-color: #fff;
  	background-color: rgba(0,0,0,.2);
    height: 8px;
    text-decoration: none;
  	 width: 8px;
	-moz-border-radius:30px;
	-webkit-border-radius:30px;
	border-radius:30px;
	-moz-box-shadow:    inset 0 1px 0 1px rgba(0,0,0,.1);
	-webkit-box-shadow:    inset 0 1px 0 1px rgba(0,0,0,.1);
	box-shadow:    inset 0 1px 0 1px rgba(0,0,0,.1);
}

.proto-navigation a:hover,
.proto-navigation a:focus {
	background-color: #999;
}

.proto-navigation .current-slide a {
	background-color: #363F4E;
}
















/*
.proto-navigation {
	margin: 0;
	padding: 0;
	list-style: none;
	position: absolute;
	right: 5px;
	bottom: -25px;
	z-index: 200;
}

.proto-navigation li {
	float: left;
	margin-right: 10px;
}

.proto-navigation li a:link,
.proto-navigation li a:visited {
	display: block;
	width: 8px;
	height: 8px;
	text-decoration: none;
	background-color: rgba(255,255,255,0.5);    
	border: 1px solid #090809;
	color: #666;
	text-indent: -9999px;
	overflow: hidden;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border-radius: 30px;
}

.proto-navigation li a:hover,
.proto-navigation li a:focus {
	background-color: #fff;
	border-color: #000;
}


.proto-navigation li.current-slide a:link,
.proto-navigation li.current-slide a:visited {
	background-color: rgba(30,30,30,0.9);

}






.proto-controls  {
	margin: 0;
	padding: 0;
	list-style: none;

}

.proto-controls .forward,
.proto-controls .backward,
.proto-controls .start-stop {
	z-index: 200;
	float: left;
	margin: 10px 10px 0 0;
}

.proto-controls .start-stop {
	margin-top: 10px;

}





.proto-controls a:link,
.proto-controls a:visited {
	display: inline-block;
	background-color: #090809;
	background-image: -moz-linear-gradient(
		center top,
		rgb(123,125,130) 2%,
		rgb(75,80,88) 3%,
		rgb(42,45,50) 100%
	);
	color: #fff;
	padding: 5px 10px;
	border: 1px solid #090809;
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	border-radius: 20px;
	text-decoration: none;
	text-align: center;
	width: 60px;
}

.proto-controls a:hover,
.proto-controls a:focus { 
	background-image: -moz-linear-gradient(
		center bottom,
		rgb(42,45,50) 100%,
		rgb(75,80,88) 90%,
		rgb(123,125,130) 20%
	);
	color: #e1e1e1;
}


.slide-caption {
	position: absolute;
	bottom: 0px;
	left: 0px;
	width: 880px;
	background-color: rgba(0,0,0,.5);
	color: #fff;
	z-index: 200;
	padding: 10px;
}


.proto-timer {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 9999;
}*/

		</style>
		
	</xsl:template>
</xsl:stylesheet>
