<?xml version="1.0" encoding="UTF-8"?>

<!-- MARC21Slim2HTML accessed from LOC April 2013, 
	revised for FLVC Islandora usage April 2013 
	by Caitlin Nelson 
	version 1.0 -->

<xsl:stylesheet version="1.0" xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<html>
			<xsl:apply-templates/>
		</html>
	</xsl:template>
	
	<xsl:template match="marc:record">
		<table>
			<xsl:apply-templates select="marc:leader"/>
			<!-- <xsl:apply-templates select="marc:datafield|marc:controlfield"/> -->
			<!-- this makes the output appear in ascending numerical order by MARC tag -->
			<xsl:apply-templates select="marc:controlfield">
				<xsl:sort select="@tag"/>
			</xsl:apply-templates>
			<xsl:apply-templates select="marc:datafield">
				<xsl:sort select="@tag"/>
			</xsl:apply-templates>
		</table>
	</xsl:template>
	
	<xsl:template match="marc:leader">
		<tr>
			<th NOWRAP="TRUE" ALIGN="RIGHT" VALIGN="TOP">
				Leader
			</th>
			<td>
				<xsl:value-of select="translate(.,' ','^')"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="marc:controlfield">
		<tr>
			<th NOWRAP="TRUE" ALIGN="RIGHT" VALIGN="TOP">
				<xsl:value-of select="@tag"/>
			</th>
			<td>
				<xsl:value-of select="translate(.,' ','^')"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="marc:datafield">
		<tr>
			<th NOWRAP="TRUE" ALIGN="RIGHT" VALIGN="TOP">
				<xsl:value-of select="@tag"/>
			</th>
			<td>
				<xsl:value-of select="translate(@ind1,' ','#')"/>
				<xsl:value-of select="translate(@ind2,' ','#')"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="marc:subfield"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="marc:subfield">
		<strong>|<xsl:value-of select="@code"/></strong><xsl:text> </xsl:text><xsl:value-of select="."/><xsl:text> </xsl:text>
	</xsl:template>

</xsl:stylesheet>
