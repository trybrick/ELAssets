<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<mail>
			<xsl:choose>
				<xsl:when test="number(ExpressLane/ContactUs/ContactUsID)">
					<ID>
						<xsl:value-of select="ExpressLane/ContactUs/ContactUsID"/>
					</ID>
				</xsl:when>
				<xsl:otherwise>
					<ID/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/ContactUs/CreatedOn) &gt; 0">
					<DateModified>
						<xsl:call-template name="Date">
							<xsl:with-param name="InValue" select="ExpressLane/ContactUs/CreatedOn" />
						</xsl:call-template>
					</DateModified>
				</xsl:when>
				<xsl:otherwise>
					<DateModified/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(ExpressLane/ContactUs/CreatedOn) &gt; 0">
					<DateCreated>
						<xsl:call-template name="Date">
							<xsl:with-param name="InValue" select="ExpressLane/ContactUs/CreatedOn" />
						</xsl:call-template>
					</DateCreated>
				</xsl:when>
				<xsl:otherwise>
					<DateCreated/>
				</xsl:otherwise>
			</xsl:choose>
			<!-- Not sure what value goes here. Will leave hard coded for now. -->
			<Site>PNS</Site>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/cardnbr) &gt; 0">
					<CardNbr>
						<xsl:value-of select="//ContactUs/formdata/cardnbr"/>
					</CardNbr>
				</xsl:when>
				<xsl:otherwise>
					<CardNbr/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/namefirst) &gt; 0">
					<NameFirst>
						<xsl:value-of select="//ContactUs/formdata/namefirst"/>
					</NameFirst>
				</xsl:when>
				<xsl:otherwise>
					<NameFirst/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/namelast) &gt; 0">
					<NameLast>
						<xsl:value-of select="//ContactUs/formdata/namelast"/>
					</NameLast>
				</xsl:when>
				<xsl:otherwise>
					<NameLast/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/address) &gt; 0">
					<Address>
						<xsl:value-of select="//ContactUs/formdata/address"/>
					</Address>
				</xsl:when>
				<xsl:otherwise>
					<Address/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/unit) &gt; 0">
					<Unit>
						<xsl:value-of select="//ContactUs/formdata/unit"/>
					</Unit>
				</xsl:when>
				<xsl:otherwise>
					<Unit/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/city) &gt; 0">
					<City>
						<xsl:value-of select="//ContactUs/formdata/city"/>
					</City>
				</xsl:when>
				<xsl:otherwise>
					<City/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/state) &gt; 0">
					<State>
						<xsl:value-of select="//ContactUs/formdata/state"/>
					</State>
				</xsl:when>
				<xsl:otherwise>
					<State/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/zip) &gt; 0">
					<Zip>
						<xsl:value-of select="//ContactUs/formdata/zip"/>
					</Zip>
				</xsl:when>
				<xsl:otherwise>
					<Zip/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="Country">
				<xsl:with-param name="State" select="//ContactUs/formdata/state" />
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/phone) &gt; 0">
					<PhoneHome>
						<xsl:value-of select="//ContactUs/formdata/phone"/>
					</PhoneHome>
				</xsl:when>
				<xsl:otherwise>
					<PhoneHome/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/phonework) &gt; 0">
					<PhoneWork>
						<xsl:value-of select="//ContactUs/formdata/phonework" />
					</PhoneWork>
				</xsl:when>
				<xsl:otherwise>
					<PhoneWork/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/subject) &gt; 0">
					<Subject>
						<xsl:value-of select="//ContactUs/formdata/subject"/>
					</Subject>
				</xsl:when>
				<xsl:otherwise>
					<Subject/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/message) &gt; 0">
					<Message>
						<xsl:value-of select="//ContactUs/formdata/message"/>
					</Message>
				</xsl:when>
				<xsl:otherwise>
					<Message/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/email) &gt; 0">
					<Email>
						<xsl:value-of select="//ContactUs/formdata/email"/>
					</Email>
				</xsl:when>
				<xsl:otherwise>
					<Email/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="ExpressLane/GenericStore">
					<StoreNbr>
						<xsl:value-of select="ExpressLane/GenericStore/StoreNumber"/>
					</StoreNbr>
				</xsl:when>
				<xsl:otherwise>
					<StoreNbr/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/selectionvalue) &gt; 0">
					<Selection>
						<xsl:value-of select="//ContactUs/formdata/selectionvalue"/>
					</Selection>
				</xsl:when>
				<xsl:otherwise>
					<Selection/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(//ContactUs/formdata/subselectionvalue) &gt; 0">
					<SubSelection>
						<xsl:value-of select="//ContactUs/formdata/subselectionvalue"/>
					</SubSelection>
				</xsl:when>
				<xsl:otherwise>
					<SubSelection/>
				</xsl:otherwise>
			</xsl:choose>
		</mail>
	</xsl:template>
	<xsl:template name="Country">
		<xsl:param name="State" />
		<xsl:variable name="Upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
		<xsl:variable name="Lower" select="'abcdefghijklmnopqrstuvwxyz'" />
		<xsl:variable name="CountryID">
			<xsl:choose>
				<xsl:when test="//State[translate(Abbreviation, $Upper, $Lower) = translate($State, $Upper, $Lower)]">
					<xsl:value-of select="//State[translate(Abbreviation, $Upper, $Lower) = translate($State, $Upper, $Lower)]/CountryID" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//State[translate(FullName, $Upper, $Lower) = $State]/CountryID" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Country" select="//ArrayOfCountry/Country[CountryID = $CountryID]/FullName" />
		<xsl:choose>
			<xsl:when test="string-length(//ArrayOfCountry/Country[CountryID = $CountryID]/FullName) &gt; 0">
				<Country>
					<xsl:value-of select="//ArrayOfCountry/Country[CountryID = $CountryID]/FullName" />
				</Country>
			</xsl:when>
			<xsl:otherwise>
				<Country/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="InValue" />
		<xsl:variable name="Date">
			<xsl:choose>
				<xsl:when test="contains($InValue, '.')">
					<xsl:value-of select="substring-before($InValue, '.')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$InValue" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="translate($Date, 'T', ' ')" />
	</xsl:template>
</xsl:stylesheet>