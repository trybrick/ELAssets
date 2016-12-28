<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<link rel="stylesheet" href="/Assets/225/Styles/hrPortal.css" media="screen" />
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/scriptaculous/1.8.3/scriptaculous.js"></script>
        <script type="text/javascript" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/site.js"></script>
		
		<div id="corpHeader">
			<img class="corpLogo" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/oneRoundysLogo.png" />
			
			<a href="https://reset-self-service.roundys.com/" target="_blank">
				<img style="float:right" src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/btn_password_2.png" />
			</a>
		</div>
		<div id="corpContent">
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

			<a href="https://employeedocs.roundys.com/Login?rtn=euid" target="_blank"><img class="empl-shop" src="/Assets/225/Images/euid2.png" /></a>
		</div>

		<div id="corpColumn">
			<div id="essMenu">
				<ul class="parent-menu">
					<li data-title="Dependents and Beneficiaries, Benefits Summary, Savings Contribution Summary, Insurance Summary, Benefits Enrollment" class="tooltip">
						<a href="https://www.yourkrogerbenefits.com"><span>Benefits</span></a>
					</li>
					<li data-title="List of Available Positions, Internal Application" class="tooltip">
						<a href="/CareerCenter.aspx"><span>Career Center</span></a>
					</li>
					<li data-title="Company Policies, Employee Bulletin Board, Employee Handbooks, Own Brand Newsletter" class="tooltip">
						<a href="https://employeedocs.roundys.com/login"><span>Employee Document Library</span></a>
					</li>
					<li data-title="Complete a short survey about your experiences at Roundy’s and why you are leaving Roundy’s" class="tooltip">
						<a href="http://www.roundysexitsurvey.com/"><span>Employee Exit Survey</span></a>
					</li>
					<li data-title="View Paycheck, Direct Deposit, W-4 Tax Information, State Tax Information, W-2 Reissue Request, Earnings Summary" class="tooltip">
						<a href="https://employees.roundys.com/psp/pshrprd/EMPLOYEE/HRMS/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?pt_fname=HC_PAYROLL_COMP&amp;FolderPath=PORTAL_ROOT_OBJECT.CO_EMPLOYEE_SELF_SERVICE.HC_PAYROLL_COMP&amp;IsFolder=true"><span>Payroll</span></a>
					</li>
					<li data-title="My Timecard, My Reports, My Requests" class="tooltip">
						<a href="https://workforceess.roundys.com/wfc/applications/wtk/html/ess/logon.jsp"><span>Timekeeping &amp; Scheduling</span></a>
					</li>
					<li data-title="Roundy’s PerkSpot" class="tooltip">
						<a href="https://roundys.perkspot.com"><span>Roundy’s PerkSpot</span></a>
					</li>
					<li data-title="Roundy’s Learning Center" class="hasSubmenu">
						<span>Roundy’s Learning Center</span>
						<ul class="submenu">
							<li><a href="http://partner.devry.edu/Home?partnerName=roundys" target="_blank"><span>DeVry Educational Partnership</span></a></li>
						</ul>
					</li>
				</ul>
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
						<a href="http://www.metromarket.net/" target="_blank">
							<img src="http://upload.gsngrocers.com/elvs/staticcontent/uploadfiles/225/metromarketLogo.png" />
						</a>	
					</li>
				</ul>
			</div>
		</div>

	</xsl:template>
</xsl:stylesheet>
