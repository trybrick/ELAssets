<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />

<xsl:template match="/" name="CouponsFAQ">
<style>
	OL.loweralpha { list-style-type: lower-alpha }
</style>



<div class="CouponsFAQ" style="padding:12px;">
<h2>How to Print Manufacturers' Coupons</h2>
  <p>
    <span>Manufacturer coupons are provided by Coupons, Inc. The manufacturers have assigned print limits to ensure all shoppers have an opportunity to print the coupons. The limit is typically two prints per coupon. First time users are required to download an Active X control to print manufacturer coupons. </span>
  </p>

  <p>
   <img alt="" border="0" height="222" src="/Assets/Common/Images/samplecoupon.jpg" width="500"/>
  </p>

  <p>
    <span><b>What is the coupon printing process for first time users?</b></span>

  </p>
  <ol type="1">
    <li>
      <span>Add selected coupons to your list.</span>
    </li>
    <li>
      <span>Install the coupon printer plug-in to print your coupons directly to your printer.</span>
    </li>

    <li>
      <span>After installing the plug-in, the selected coupon offers are sent to your default printer to print.</span>
    </li>
    <li>
      <span>Verify the printer is connected, turned on, ready to print, and that the printer is set as the default printer on your computer. </span>
    </li>
    <li>
      <span>Coupons will print in this order: </span>

    <ol class="loweralpha">
        <li><span>Manufacturer coupons</span></li>
        <li><span>Shopping list</span></li>
        <li><span>If available, store specific coupons (hooray, no print limits here!)</span></li>
    </ol>
        </li>

  </ol>
  <p>
    <span><b>How do I install the Active X coupon printer?</b></span>
  </p>
  <ol type="1">
    <li>

      <span>Click the "print coupon" button. You will be prompted to install the coupon Printer.</span>
    </li>
    <li>
      <span>Click on "Run" to begin the installation process.</span>
    </li>
    <li>
      <span>Agree with the "terms and conditions" to complete the installation process. An "Installation Successful" message will be displayed.</span>

    </li>
  </ol>

  <p>
    <span><b>Why didn't the installation work? </b></span>
  </p>

  <ol type="1">
    <li>
      <span>You may not have permission to download programs on your computer, or you are using software that blocks the installation</span><span>.</span><br/>
      <span>If you are trying to print coupons from a computer at a library, at work, an Internet cafe, or university, you may not be permitted to download and install programs. This may be the case even if you've downloaded and installed other files. Contact your network administrator for more information. When available, you may find it easier to print our coupons at home.</span>
    </li>
    <li>
      <span>You may also be running software that prevents installation on your computer. Please check that any anti-virus or anti-spyware or adware software is turned off. We have attempted to work with most of the major publishers of such software to ensure that our Coupon Printer is not blocked. However, programs may block the installation, or display warnings before installing a program. Choose to allow the installation.</span>

    </li>
    <li>
      <span>The security settings in your browser are set too high</span><span>.</span><br/>
      <span>If you receive warnings or errors that an attempt to install an ActiveX control (Internet Explorer), a plug-in was blocked, or are asked permission to install a program, you may need to change your browser's security settings to allow installation of these types of controls. Also, make sure to click the appropriate buttons in any dialog boxes that display to allow the installation. Modern browsers make you jump through a few hoops to install plug-in, but it's worth it!</span>
    </li>
    <li>
      <span>You are using an Apple Macintosh (MAC) and received a PC (.exe) coupon printer file. </span><span>W</span><span>e are sorry your browser type has not been recognized correctly. Please find our Macintosh version of the Coupon Printer installer below: </span><br/><br/>
    <span><strong>Macintosh OSX 10.3 or higher when used with Safari and Firefox Browsers</strong></span>
  <br/>
    <span><a href="http://ftp.coupons.com/Safari/MacCouponPrinter.dmg">http://ftp.coupons.com/Safari/MacCouponPrinter.dmg</a></span> 
    </li>
  </ol>
  
  
  <p>
    <span><b>Printing Issues</b></span>
  </p>
  
  <span>When multiple printers are available and/or have a fax machine connected, the default printer has likely not been set. Before printing the coupons, users must have a default printer set to ensure coupons know which printer to print to. To set up/change a default printer, please follow the below instructions:</span>

  <p>

  </p>
  <p>
    <span><u>Windows</u></span>
  </p>
  <ol type="1">
    <li>
      <span>Click Start &gt; Control Panel &gt; Printers and Faxes. Your printers should be displayed.</span>

    </li>
    <li>
      <span>Right click on the printer you wish to print from and select "Set as Default Printer."</span>
    </li>
  </ol>


  <p>
    <span><u>Macintosh (MAC)</u></span>
  </p>
  <p>
    <span>To change the default printer:</span>
  </p>

    <ol type="1">
      <li>
        <span>From the print dialog, choose Edit Printer List from the Printer pop-up menu.</span>
      </li>
      <li>
        <span>Select a printer from the Printer List.</span>
      </li>

      <li>
        <span>Choose "Make Default" from the Printer menu.</span>
      </li>
    </ol>
  
    <p>
      <span><b>What is Manufacturer Coupon Print Status?</b></span>
    </p>

  <p>

    <span>If coupons are not printing, please review the bottom of your shopping list to check the status for Printing or Expired coupon status.</span>
  </p>
  <p>
    <span>For example: </span>
  </p>
  <ul >
    <li>
     SAVE $.75 ON TWO when you buy TWO any flavor Betty Crocker&#174; Box Supreme Brownie Mixes - <b> Printing </b>

    </li>
    <li>
      SAVE $.40 when you buy ONE BOX any flavor/variety Nature Valley&#174; Granola Bars - <b> Printing </b>
    </li>
    <li>
      Save $0.50 off the Cover Price of the August 4th issue of Woman's Day Magazine <b>- Printing </b>

    </li>
  </ul>

</div>




</xsl:template>
</xsl:stylesheet>