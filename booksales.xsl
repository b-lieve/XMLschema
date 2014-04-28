<?xml version="1.0" encoding="UTF-8"?>

<!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Sun Apr 27 17:59:42 PDT 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xslFormatting="urn:xslFormatting">
	<xsl:output method="html" indent="no"/>
	<xsl:template match="/booksales">
		<html>
			<body>
				<h2>Authors</h2>
				<p>fuck</p>
				<xsl:if test="Authors">
					<table>
						<tr bgcolor="#9acd32">
							<th>ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
						</tr>
						<xsl:for-each select="Authors/Author">
							<tr>
								<td>
									<xsl:value-of select="ID"/>
								</td>
								<td>
									<xsl:value-of select="Name"/>
								</td>
								<td>
									<xsl:value-of select="Email"/>
								</td>
								<td>
									<xsl:value-of select="Phone"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:if>
				<xsl:if test="Books">
					<table>
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
						<xsl:for-each select="Books/Book">
							<xsl:for-each select="Formats">
							<xsl:choose>
							<xsl:when test="position() &lt;2">
								<td>when</td>
							</xsl:when>
							<xsl:otherwise><td>otherwise</td></xsl:otherwise>
							</xsl:choose>
								<tr>	<xsl:if test="position() &lt;2<">
						<td rowspan='<xsl:value-of select="count(../Formats)"/>' ><xsl:value-of select="../ISBN"/></td>
						<td  rowspan='<xsl:value-of select="count(../Formats)"/>'><xsl:value-of select="../Title"/></td>
						<td  rowspan='<xsl:value-of select="count(../Formats)"/>'><xsl:value-of select="../Author"/></td>
						 </xsl:if>	
									<td>
										<xsl:value-of select="../ISBN"/>
									</td>
									<td>
										<xsl:value-of select="../Title"/>
									</td>
									<td>
										<xsl:value-of select="../Author"/>
									</td>
									<td>
										<xsl:value-of select="position()"/>
									</td><!--	 <td rowspan="<xsl:value-of select=\"count(../Formats)\"/>" ></td> -->
									<td>
										<xsl:value-of select="Format"/>
									</td>
									<td>
										<xsl:value-of select="MSRP"/>
									</td>
									<td>
										<xsl:value-of select="position()"/>
									</td>
									<td>
										<xsl:value-of select="../Title"/>
									</td><!--			<xsl:choose>
							<xsl:when test="WeeksBSL !=''">
								<td  rowspan='<xsl:value-of select="count(../Formats)"/>'><xsl:value-of select="../WeeksBSL"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td  rowspan='<xsl:value-of select="count(../Formats)"/>'></td>
							</xsl:otherwise>
						</xsl:choose>  -->
								</tr>
							</xsl:for-each>
						</xsl:for-each>
					</table>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
