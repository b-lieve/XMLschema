<?xml version="1.0" encoding="UTF-8"?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Sun Apr 27 17:59:42 PDT 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xslFormatting="urn:xslFormatting">
<xsl:output method="html" indent="no"/>
<xsl:template match="/booksales">
	<html>
		<head>
			<title>
				booksales
			</title>
			 <link rel="stylesheet" type="text/css" href="booksales.css"/>
		</head>
		<body>
			<h2>Authors</h2>
			<xsl:apply-templates/>				
		</body>
	</html>
</xsl:template>
<xsl:template match="Authors">		
	<table id="authors">
		<tr bgcolor="#9acd32">
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Phone</th>
		</tr>
		<xsl:for-each select="Author">
			<tr>
				<td><xsl:value-of select="ID"/></td>
				<td><xsl:value-of select="Name"/></td>
				<td><xsl:value-of select="Email"/></td>
				<td><xsl:value-of select="Phone"/></td>
			</tr>
		</xsl:for-each>
	</table>	
</xsl:template>
<xsl:template match="Books">	
	<h2>Books</h2>
	<table id="books">
		<tr bgcolor="#9acd32">
			<th rowspan="2">ISBN</th>
			<th rowspan="2">Title</th>
			<th rowspan="2">Author</th>
			<th colspan="2">Formats</th>
			<th rowspan="2">WeeksBSL</th>
		</tr>
		<tr bgcolor="#9acd32">
			<th>Format</th>
			<th>MSRP</th>
		</tr>
<xsl:apply-templates/>	
	</table>
</xsl:template>

<xsl:template match="Book">
	<xsl:for-each select="Formats">
		<tr>
		<xsl:choose>
			<xsl:when test="position() &lt;2">
				<td rowspan="{count(../Formats)}">
					<xsl:value-of select="../ISBN"/>
				</td>
				<td rowspan="{count(../Formats)}">
					<xsl:value-of select="../Title"/>
				</td>
				<td rowspan="{count(../Formats)}">
					<xsl:value-of select="../Author"/>
				</td>
					
			</xsl:when>
		</xsl:choose>		 	
			<td><xsl:value-of select="Format"/></td>
			<td><xsl:value-of select="MSRP"/></td>	
		<xsl:choose>
			<xsl:when test="position() &lt;2">
				<xsl:choose>
					<xsl:when test="../WeeksBSL">
						<td rowspan="{count(../Formats)}">
							<xsl:value-of select="../WeeksBSL"/>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td rowspan="{count(../Formats)}"></td>
					</xsl:otherwise>
				</xsl:choose>		
			</xsl:when>
		</xsl:choose>	
		</tr>
	</xsl:for-each>
</xsl:template>

<xsl:template match="SalesInfo">	
	<h2>Sales Info</h2>
	<table id="salesinfo">
		<tr bgcolor="#9acd32"><th rowspan='3'>Book</th><th colspan='4'>Book Sales</th></tr>
		<tr bgcolor="#9acd32"><th rowspan='2'>Format</th><th colspan='3'>sales</th></tr>
		<tr bgcolor="#9acd32"><th>Retailer</th><th>Price</th><th>Units Sold</th></tr>
	<xsl:for-each select="OneSalesInfo">
		
		<xsl:variable name="rowcount" select="count(BookSales/BookSale/Sales/Sale)"></xsl:variable>
		<xsl:for-each select="BookSales/BookSale">
			<xsl:variable name="bookposition"  as="xs:integer"><xsl:value-of select="position()"/></xsl:variable>
			
			<xsl:for-each select="Sales/Sale">  <!--embed <tr> in middle does not work-->
				<tr>
					<xsl:variable name="bookid" select="Book"></xsl:variable>
					<xsl:choose>
							<xsl:when test="($bookposition+position()) =2">
								<td rowspan="{$rowcount}"> <xsl:value-of select="../../../../Book" /></td>		
							</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="position()&lt;2">
							<td rowspan="{count(../Sale)}"> <xsl:value-of select="../../Format" /></td>
							
						</xsl:when>									
					</xsl:choose>	  
						
					<td> <xsl:value-of select="Retailer" /></td>
					<td> <xsl:value-of select="Price" /></td>
					<td> <xsl:value-of select="UnitsSold" /></td>
				</tr>
					
			</xsl:for-each>
		</xsl:for-each>
	</xsl:for-each>
	</table>
</xsl:template>	
</xsl:stylesheet>
