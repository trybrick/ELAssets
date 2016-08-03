<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:template match="/">
    <script type="text/javascript">
			<xsl:comment>
				<![CDATA[
				var pages = 3;
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
    <div id="Pharmacy" class="departmentPage">
		<div class="leftnav">
			<a href="#" onclick="javascript:showOne('div1');">Filling Prescriptions</a>
			<a href="#" onclick="javascript:showOne('div2');">Maintenance 90 Program</a>
			<a href="#" onclick="javascript:showOne('div3');">Pharmacy Gold Club</a>
			<xsl:for-each select="ExpressLane/ArrayOfStaticContent/StaticContent">
				<xsl:sort select="SortBy" />
				<a target="_blank"><xsl:attribute name="href"><xsl:value-of select="Image" /></xsl:attribute><xsl:value-of select="Title" /></a>
			</xsl:for-each>		
		</div>
      <div id="div1" class="contentDiv" style="display:block;">
        <h3 class="pageHeading">Pharmacy</h3>
        <h4>Individual Attention</h4>
        <p>Personal service at the pharmacy counter can help you be more informed about your condition and more comfortable with your medicine. At Trig's, our pharmacists make a point of getting to know you because they care about what's really going on with your health. Each is experienced, friendly, and helpful.</p>
        <h4>Filling Prescriptions</h4>
        <p>Call our pharmacy for personal assistance any time during our regular hours. If you prefer, you may also use our internet refill service, available 24 hours a day, 7 days a week in Eagle River, Minocqua, Rhinelander, Stevens Point, and Wausau. <strong>Click on a location below to refill your prescription.</strong></p>
        <ul>
          <li><a href="http://www.refillrx.com/rrxsrvx.dll?MfcISAPICommand=Request&amp;pg=1&amp;asi=trigs-eagleriver" target="_blank">Eagle River</a></li>
          <li><a href="http://www.refillrx.com/rrxsrvx.dll?MfcISAPICommand=Request&amp;pg=1&amp;asi=trigs-minocqua" target="_blank">Minocqua</a></li>
          <li><a href="http://www.refillrx.com/rrxsrvx.dll?MfcISAPICommand=Request&amp;pg=1&amp;asi=trigs-rhinelander" target="_blank">Rhinelander</a></li>
          <li><a href="http://www.refillrx.com/rrxsrvx.dll?MfcISAPICommand=Request&amp;pg=1&amp;asi=trigs-point" target="_blank">Stevens Point</a></li>
          <li><a href="http://www.refillrx.com/rrxsrvx.dll?MfcISAPICommand=Request&amp;pg=1&amp;asi=trigs-wausau" target="_blank">Wausau</a></li>
        </ul>
        <p>For convenient 1-stop shopping, have your prescriptions filled while you get groceries. We also offer a mail-out service for home delivery. We honor most national insurance plans and have the flexibility to work with local employers and facilities to handle special cases. Both generic and national brand medicines are available.</p>
        <h4>Hours &amp; Phone Numbers</h4>
        <table style="width:600px">
          <tr class="tableHeading">
            <td>Location</td>
            <td>Phone</td>
            <td>Pharmacy Hours</td>
          </tr>
          <tr>
            <td>Eagle River</td>
            <td>715.479.6413</td>
            <td rowspan="5" valign="middle">Monday – Friday 9 AM – 6 PM<br />
              Saturday 9 AM – 5 PM<br />
              Sunday Closed</td>
          </tr>
          <tr>
            <td>Minocqua</td>
            <td>715.356.9449</td>
          </tr>
          <tr>
            <td>Rhinelander</td>
            <td>715.369.4849</td>
          </tr>
          <tr>
            <td>Stevens Point</td>
            <td>715-341-6102</td>
          </tr>
          <tr>
            <td>Wausau</td>
            <td>715.848.9066</td>
          </tr>
        </table>
		<h4>TV Commercial</h4>
		<div class="Video">
			<object width="425" height="350"> <param name="movie" value="http://www.youtube.com/v/yJvL_XlK45c"> </param> <embed src="http://www.youtube.com/v/yJvL_XlK45c" type="application/x-shockwave-flash" width="425" height="350"> </embed> </object>
		</div>
      </div>
      <div id="div2" class="contentDiv" style="display:none;"> <a name="top"></a>
        <h4>Trig's Maintenance 90 Program</h4>
        <p>Trig's Maintenance 90 Program offers 90 Tablets/Capsules for $12.99 The generic medications covered by this program are drugs commonly used to treat chronic health conditions such as, diabetes and high blood pressure. This program does not include all drugs used for these conditions and may not cover all strengths of the listed medications. Your participation in certain prescription drug insurance plans may entitle you to pay even less than the $12.99 for some or all of these medications. If you are eligible for such coverage, you will only be charged the lesser of the applicable amounts. Visit Trig's Pharmacy for a complete list of medications covered under this program. List is subject to change without notice.</p>
		<ul>
			<li><a href="#bloodPressure">Blood Pressure &amp; Heart Health</a></li>
			<li><a href="#cholesterol">Cholesterol</a></li>
			<li><a href="#diabetes">Diabetes</a></li>
			<li><a href="#gastroIntestinal">Gastrointestinal</a></li>
			<li><a href="#mentalHealth">Mental Health</a></li>
			<li><a href="#painArthritis">Pain &amp; Arthritis</a></li>
			<li><a href="#thyroidConditions">Thyroid Conditions</a></li>
			<li><a href="#womensHealth">Women's Health</a></li>
			<li><a href="#other">Other</a></li>
		</ul>
		<br />
        <div><a name="bloodPressure" class="named"><span style="font-size:16px">Blood Pressure &amp; Heart Health</span></a><br/>
          <br/>
          <table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
            <tr>
              <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
              <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
              <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
              <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> AMILORIDE/HCTZ </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 5/50MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> CHLORTHALIDONE </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 25MG, 50MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> ISOSORBIDE DINITRATE </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 5MG, 10MG, 20MG TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> ATENOLOL </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 25MG, 50MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> CLONIDINE </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 0.1MG, 0.2MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> ISOSORBIDE MONO. </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 30MG TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> ATENOLOL </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 100MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> DIGOXIN </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 0.125MG, 0.25MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> ISOSORBIDE MONO. </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 60MG TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> ATENOLOL/CHLOR </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 50/25, 100/25 TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> DILTIAZEM </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 30MG, 60MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> LISINOPRIL </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 2.5MG, 5MG TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> BENAZEPRIL </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 5MG, 10MG, TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> DILTIAZEM </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 90MG, 120MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> LISINOPRIL </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG, 20MG TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> BENAZEPRIL </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 20MG, 40MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> DOXAZOSIN </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1MG, 2MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> LISINOPRIL/HCTZ </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10/12.5, 20/12.5, 20/25 TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> BISOPROPROL/HCTZ </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 2.5/6.25MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> DOXAZOSIN </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 4MG, 8MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> METOPROLOL TARTRATE </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 25MG, 50MG, 100MG TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> BISOPROPROL/HCTZ </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 5/6.25MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> ENALAPRIL </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 2.5MG, 5MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> PROPRANOLOL </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG, 20MG, 40MG, 80MG TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> BISOPROPROL/HCTZ </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 10/6.25MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> ENALAPRIL </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG, 20MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> TERAZOSIN </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1MG, 2MG, 5MG CAP </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> BUMETANIDE </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 0.5MG, 1MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> ENALAPRIL/HCTZ </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 5/12.5MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> TRIAM/HCTZ </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 37.5/25 TAB/CAP </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> CAPTOPRIL </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 12.5MG, 25MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> FUROSEMIDE </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 20MG, 40MG, 80MG </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> TRIAM/HCTZ </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 75/50 TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> CAPTOPRIL </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 50MG, 100MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> HYDROCHLOROTHIAZIDE </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 12.5MG CAP </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> VERAPAMIL </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 40MG (IR) TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> CARVEDILOL </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 3.125MG, 6.25MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> HYDROCHLOROTHIAZIDE </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 50MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> VERAPAMIL </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 80MG (IR) TAB </b></p></td>
            </tr>
            <tr>
              <td bgcolor="white" width="58"><p><b> CARVEDILOL </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> 12.5MG, 25MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> INDAPAMIDE </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1.25MG, 2.5MG TAB </b></p></td>
              <td bgcolor="white" width="60"><p align="center"><b> VERAPAMIL </b></p></td>
              <td valign="top" bgcolor="white" width="60"><p align="center"><b> 120MG (IR) TAB </b></p></td>
            </tr>
          </table>
          <br/>
          <br/>
          <br/>
          <br/>
		<div><a name="cholesterol" class="named"><span style="font-size:16px">CHOLESTEROL</span></a><br/>
            <br/>
            <table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
              <tr>
                <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> LOVASTATIN </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 10MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> LOVASTATIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 20MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> PRAVASTATIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> PRAVASTATIN </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 20MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b></b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> </b></p></td>
              </tr>
            </table>
          </div>
          <br/>
          <br/>
          <br/>
          <br/>
          <div><a name="diabetes" class="named"><span style="font-size:16px">DIABETES</span></a><br/>
            <br/>
            <table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
              <tr>
                <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> CHLORPROPAMIDE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 100MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> GLYBURIDE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 5MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> METFORMIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 850MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> GLIMEPIRIDE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 1MG, 2MG, 4MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> GLYBURIDE MICRO </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1.5MG, 3MG </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> METFORMIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1000MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> GLIPIZIDE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 5MG, 10MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> GLYBURIDE MICRO </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 6MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> METFORMIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 500MG ER TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> GLYBURIDE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 1.25MG, 2.5MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> METFORMIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 500MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> </b></p></td>
              </tr>
            </table>
            <br/>
            <br/>
            <br/>
            <br/>
          </div>
 		<div><a name="gastroIntestinal" class="named"><span style="font-size:16px">GASTROINTESTINAL</span></a><br/>
            <br/>
            <table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
              <tr>
                <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> BELLADONNA </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> ALKA/PB TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> DICYCLOMINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 20MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> CIMETIDINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 300MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> FAMOTIDINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 20MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> METOCLOPRAMIDE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> CIMETIDINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 400MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> RANITIDINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 150MG, 300MG TAB </b></p></td>
				<td bgcolor="white" width="58"><p><b> DICYCLOMINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 10MG CAP </b></p></td>
              </tr>
            </table>
          </div>
          <br/>
          <br/>
          <br/>
          <br/>
          <div><a name="mentalHealth" class="named"><span style="font-size:16px">MENTAL HEALTH</span></a><br/>
            <br/>
            <table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
              <tr>
                <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> AMITRIPTYLINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 10MG, 25MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> DOXEPIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG, 25MG CAP </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> NORTRIPTYLINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 50MG CAP </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> AMITRIPTYLINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 50MG, 75MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> DOXEPIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 50MG, 75MG CAP </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> PROCHLORPERAZINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> AMITRIPTYLINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 100MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> DOXEPIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 100MG CAP </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> THIORIDAZINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG ,25MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> BENZTROPINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 0.5MG, 1MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> FLUOXETINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG, 20MG CAP </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> THIOTHIXENE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1MG CAP </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> BENZTROPINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 2MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> FLUPHENAZINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> THIOTHIXENE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 2MG CAP </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> BUSPIRONE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 5MG,10MG,15MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> HALOPERIDOL </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 0.5MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> TRAZODONE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 50MG, 100MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> CARBAMAZEPINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 200MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> HALOPERIDOL </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1MG, 2MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> TRIHEXYPHENIDYL </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 2MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> CITALOPRAM </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 10MG, 20MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> LITHIUM CARB </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 300MG CAP </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> CITALOPRAM </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 40MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> NORTRIPTYLINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MG ,25MG CAP </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> </b></p></td>
              </tr>
            </table>
          </div>
          <br/>
          <br/>
          <br/>
          <br/>
		<div><a name="painArthritis" class="named"><span style="font-size:16px">PAIN &amp; ARTHRITIS</span></a><br/>
            <br/>
			<table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
              <tr>
                <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> IBUPROFEN </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 600MG, 800MG Tabs </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> MELOXICAM </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 7.5MG </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> NAPROXEN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 375MG, 500MG Tabs </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> PIROXICAM </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 10MG, 20MG CAPS </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> SALSALATE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 500MG, 750MG Tabs </b></p></td>
				<td bgcolor="white" width="60"><p align="center"><b> </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> </b></p></td>
              </tr>
            </table>
			<br/>
            <br/>
            <br/>
            <br/>
          </div>
			
			
          <div><a name="thyroidConditions" class="named"><span style="font-size:16px">THYROID CONDITIONS</span></a><br/>
            <br/>
            <table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
              <tr>
                <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> LEVOTHYROXINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 25MCG </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> LEVOTHYROXINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 88MCG </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> LEVOTHYROXINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 125MCG </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> LEVOTHYROXINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 50MCG </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> LEVOTHYROXINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 100MCG </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> LEVOTHYROXINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 137MCG </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> LEVOTHYROXINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 75MCG </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> LEVOTHYROXINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 112MCG </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> LEVOTHYROXINE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 150MCG </b></p></td>
              </tr>
            </table>
          </div>
          <br/>
          <br/>
          <br/>
          <br/>
          <div><a name="womensHealth" class="named"><span style="font-size:16px">WOMENS HEALTH</span></a><br/>
            <br/>
            <table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
              <tr>
                <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> ESTRADIOL </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 0.5MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> ESTRADIOL </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 1MG,2MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> ESTROPIPATE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 0.75MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> ESTROPIPATE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 1.5MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> MEDROXYPROGESTERONE </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 2.5MG, 5MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> </b></p></td>
              </tr>
            </table>
          </div>
          <br/>
          <br/>
          <br/>
          <br/>
          <div><a name="other" class="named"><span style="font-size:16px">OTHER</span></a><br/>
            <br/>
            <table width="500" border="0" cellspacing="1" cellpadding="3" bgcolor="#838383">
              <tr>
                <td valign="top" bgcolor="#dfedb6" width="95"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="90"><p><b>Medication</b></p></td>
                <td valign="top" bgcolor="#dfedb6" width="60"><p align="center"><b>Tabs/Caps</b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> ALLOPURINOL </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 100MG TAB </b></p></td>
				<td bgcolor="white" width="58"><p><b> ALLOPURINOL </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 300MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> OXYBUTYNIN </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 5MG TAB </b></p></td>
              </tr>
              <tr>
                <td bgcolor="white" width="58"><p><b> COLCHICINE </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> 0.6MG TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> POTASSIUM </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> 10MEQ TAB </b></p></td>
                <td bgcolor="white" width="60"><p align="center"><b> </b></p></td>
                <td valign="top" bgcolor="white" width="60"><p align="center"><b> </b></p></td>
              </tr>
            </table>
          </div>
          <div> <a href="#top">BACK TO TOP</a> </div>
        </div>
      </div>
      <div id="div3" class="contentDiv" style="display:none;">
        <h4>Trig's Pharmacy Gold Club</h4>
        <p>Fill A Prescription ~ Get A Gold Card ~ Fill A Gold Card ~ Get A $10.00 Trig's Gift Card</p>
          <!--<a>
          <xsl:attribute name="href">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/goldcard.jpg</xsl:attribute>
          ...more information</a>-->
        <img alt="">
        	<xsl:attribute name="src">##root##/Assets/<xsl:value-of select="//GenericChain/ChainID" />/Images/goldcard.jpg</xsl:attribute>
        </img>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2007. Progress Software Corporation. All rights reserved.

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