<?xml version='1.0' encoding="UTF-8"?>

<xsl:stylesheet
	xmlns:u="http://uniprot.org/uniprot"
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	version='1.0'
	>
<xsl:output method="text"  encoding="UTF-8" />

<xsl:variable name="separator" select="'~~~'" />
<xsl:variable name="newline" select="'&#10;'" />

<xsl:template match="/">
        <xsl:for-each select="//u:entry">
          <!-- HEADER -->
          <xsl:text>></xsl:text>
					<xsl:value-of select="u:name[1]" />
          <xsl:text> </xsl:text>
          <xsl:value-of select="u:dbReference[@type='EC']/@id" />
          <xsl:value-of select="$separator" />
          <xsl:value-of select="u:gene/u:name[@type='primary' or @type='ordered locus']" />
          <xsl:value-of select="$separator" />
          <xsl:value-of select="u:protein/*/u:fullName[1]" />
          <xsl:value-of select="$separator" />
          <xsl:value-of select="u:dbReference[@type='eggNOG' and u:property[@type='taxonomic scope' and @value='LUCA']]/@id" />
          <xsl:value-of select="$newline" />


					<!-- <xsl:value-of select="$quote" /><xsl:value-of select="u:protein/*/u:fullName[1]" /><xsl:value-of select="$quote" />
					<xsl:value-of select="$separator" />
					<xsl:value-of select="$quote" /><xsl:value-of select="u:gene/u:name[@type='primary' or @type='ordered locus']" /><xsl:value-of select="$quote" />
					<xsl:value-of select="$separator" />
					<xsl:value-of select="$quote" /><xsl:value-of select="u:dbReference[@type='EC']/@id" /><xsl:value-of select="$quote" />
					<xsl:value-of select="$separator" />
					<xsl:value-of select="$quote" /><xsl:value-of select="u:dbReference[@type='eggNOG' and u:property[@type='taxonomic scope' and @value='LUCA']]/@id" /><xsl:value-of select="$quote" />
					<xsl:value-of select="$separator" />
          <xsl:value-of select="$newline" /> -->

          <!-- SEQUENCE -->
					<xsl:value-of select="u:sequence[1]" />
					<xsl:value-of select="$newline" />
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
