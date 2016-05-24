<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  
  
  <xsl:output method="xml" indent="yes"/>



  <xsl:template match="/">
    <testing_applications>
      <xsl:for-each select="testing_applications/testing_application">
        <xsl:sort select="platform_long_name"/>
        <xsl:sort select="application_code"/>
        <item type="testing_application">

          <xsl:attribute name="response_time">
            <xsl:value-of select="average_time_to_process" />
          </xsl:attribute>
          <xsl:attribute name="business">
            <xsl:value-of select="business"/>
          </xsl:attribute>
          <xsl:attribute name="result_type">
            <xsl:value-of select="result_type"/>
          </xsl:attribute>
          <xsl:attribute name="supports_content_blocking">
            <xsl:value-of select="supports_content_blocking"/>
          </xsl:attribute>
          <xsl:attribute name="desktop_client">
            <xsl:value-of select="desktop_client"/>
          </xsl:attribute>


          <xsl:variable name="status">
            <xsl:value-of select="status"/>
          </xsl:variable>
          
          <xsl:attribute name="availability" >
            <xsl:choose>
                <xsl:when test="$status ='0'">
                  <xsl:text>available</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>Not Available</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
          </xsl:attribute>
          
          <xsl:attribute name ="default">
            <xsl:value-of select ="default"/>
          </xsl:attribute>
          <xsl:attribute name="platform_name">
            <xsl:value-of select="platform_name"/>
          </xsl:attribute>
          <xsl:attribute name="platform_long_name">
            <xsl:value-of select="platform_long_name"/>
          </xsl:attribute>
          <xsl:attribute name="application_code">
            <xsl:value-of select="application_code"/>
          </xsl:attribute>
          <xsl:attribute name="application_long_name">
            <xsl:value-of select="application_long_name"/>
          </xsl:attribute>

        </item>
      </xsl:for-each>
    </testing_applications>
  </xsl:template>

</xsl:stylesheet>