<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">


<style>
body {
  background-repeat: no-repeat;
  background-position: bottom right;
  margin:0;
}

.think {
	font-family: Calisto MT, Times New Roman, Book antiqua, Bookman old style, Garamond;
	color: #CCCCCC;
}
#errortable	{
	  	background: transparent url("/Assets/Common/Images/warning.gif") no-repeat bottom right;
		height:400px;
		margin-left:30px;
		width:860px;
		margin-top:30px;
}
</style>


<table id="errortable" width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"> 

  <tr> 
    <td align="left" valign="top"> 
      <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="think" style="font-size: 60px">whoops...</span> </td>

        </tr>
        <tr> 
          <td><div align="center"><span class="think" style="font-size: 24px">we seem to have had a bit of a little glitch!</span></div></td>
        </tr>
      </table>
      <span class="think" style="font-size: 14px; color:black;">
      <br/>
      We apologize for any inconvenience you are experiencing and are currently working to rectify this issue. <br/><br/>
      Please try again, or try back in a few minutes<br/><br/>
      Click 
      <a><xsl:attribute name="href">##root##</xsl:attribute> here </a> 
      to go back to the main page.<br/><br/>
      </span>
    </td>
  </tr>

</table>




</xsl:template>
</xsl:stylesheet>