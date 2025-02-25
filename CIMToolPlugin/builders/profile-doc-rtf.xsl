<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns="http://www.w3.org/1999/xhtml" 
	xmlns:a="http://langdale.com.au/2005/Message#">	
<xsl:output indent="no" method="text" encoding="ASCII"/>
<xsl:param name="baseURI"/>
<xsl:param name="envelope">Profile</xsl:param>
<xsl:variable name="apos">'</xsl:variable>
<xsl:template match="a:Catalog">{\rtf1\ansi\ansicpg1252\deff0\deflang1033\deflangfe1033\fs20{\fonttbl{\f0\fswiss\fprq2\fcharset0 Arial;}{\f1\fswiss\fprq2\fcharset0{\*\fname Arial;}Arial CE;}
{\f23\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Arial;}}{\colortbl;\red0\green0\blue238;}
\pard\plain \sb120\qj\fs20\lang1033
{\par\b\fs28<xsl:value-of select="$envelope"/><xsl:if test="$envelope != 'Profile'"><text> Profile</text></xsl:if>\par}Profile namespace:  <xsl:value-of select="$baseURI" /> 
\par\pard\plain \sb120\qj\fs20\lang1033 
<xsl:if test="count(/.//a:ComplexType) > 0">
{\par\b\fs28 Concrete Classes \par}
<xsl:apply-templates select="a:Root|a:Message">
<xsl:sort select="@name"/>
</xsl:apply-templates>
</xsl:if>

<xsl:if test="count(/.//a:ComplexType) > 0">
{\par\b\fs28 Abstract Classes \par}
<xsl:apply-templates select="a:ComplexType"  >
<xsl:sort select="@name"/>
</xsl:apply-templates>
</xsl:if>

<xsl:if test="count(/.//a:EnumeratedType) > 0">
{\par\b\fs28 Enumerations \par}
<xsl:apply-templates select="a:EnumeratedType" >
<xsl:sort select="@name"/>
</xsl:apply-templates>
</xsl:if>

<xsl:if test="count(/.//a:CompoundType) > 0">
{\par\b\fs28 Compound Types \par}
<xsl:apply-templates select="a:CompoundType"  >
	<xsl:sort select="@name"/>
</xsl:apply-templates>
</xsl:if>

<xsl:if test="count(/.//a:SimpleType) > 0">
{\par\b\fs28 Datatypes \par}
<xsl:apply-templates select="a:SimpleType" >
	<xsl:sort select="@name"/>
</xsl:apply-templates>
</xsl:if>
\par}}}}}}}}
</xsl:template>
	
<xsl:template match="a:Message">
{\par\b\fs24 {\*\bkmkstart <xsl:value-of select="@name"/>}<xsl:value-of select="@name"/>}{\fs24 {\*\bkmkend <xsl:value-of select="@name"/>}}<xsl:apply-templates mode="annotate-type" /><xsl:apply-templates />
</xsl:template>

<xsl:template match="a:Root">
{\par\b\fs24 {\*\bkmkstart <xsl:value-of select="@name"/>}<xsl:value-of select="@name"/>}{\fs24 {\*\bkmkend <xsl:value-of select="@name"/>}}<xsl:call-template name="complex_type" />
</xsl:template>
		
<xsl:template name="complex_type"><xsl:apply-templates mode="annotate-type" />
\par\pard\plain \sb120\qj\fs20\lang1033 
<xsl:if test="a:Domain|a:Simple|a:Instance|a:Reference|a:Enumerated">{\par\b\fs20 Native Members\par}
\par
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2000
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2720
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx4125
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16\qc\b name \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b mult \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b type \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b description \cell}
\row
}
<xsl:apply-templates select="a:Domain|a:Simple|a:Instance|a:Reference|a:Enumerated" />
</xsl:if>
<xsl:if test="a:SuperType">{\par\b\fs20 Inherited Members\par}\par
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2000
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2720
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx4125
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16\qc\b name \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b mult \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b type \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b description \cell}
\row
}
<xsl:apply-templates select="a:SuperType" mode="inherited"/>
</xsl:if>	
</xsl:template>

<xsl:template match="a:Instance|a:Reference|a:Enumerated|a:Domain">
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2000
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2720
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx4125
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@name"/> \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@minOccurs"/>..<xsl:choose><xsl:when test="@maxOccurs = 'unbounded'"><item>* </item></xsl:when><xsl:otherwise><xsl:value-of select="@maxOccurs"/></xsl:otherwise></xsl:choose> \cell}
{\pard \intbl \sb120\sa120\fs16 {\field{\*\fldinst {\fs16 HYPERLINK  \\l "<xsl:value-of select="@type"/>"}}{\fldrslt {\fs16\ul\cf1 <xsl:value-of select="@type"/>}}} \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:apply-templates mode="annotate-table-row" /> \cell}
\row
}
</xsl:template>
	
<xsl:template match="a:Simple">
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2000
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2720
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx4125
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@name"/> \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@minOccurs"/>..<xsl:value-of select="@maxOccurs"/> \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@xstype"/> \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:apply-templates mode="annotate-table-row" /> \cell}
\row
}
</xsl:template>

<xsl:template match="a:SuperType" mode="inherited">
	<xsl:apply-templates select="//a:ComplexType[@name=current()/@name]" mode="inherited"/>
	<xsl:apply-templates select="//a:Root[@name=current()/@name]" mode="inherited"/>
</xsl:template>

<xsl:template match="a:ComplexType|a:Root" mode="inherited">
	<xsl:apply-templates select="a:Domain|a:Simple|a:Instance|a:Reference|a:Enumerated" mode="inherited"/>
	<xsl:apply-templates select="a:SuperType" mode="inherited"/>
</xsl:template>
	
<xsl:template match="a:Instance|a:Reference|a:Enumerated|a:Domain" mode="inherited">
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2000
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2720
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx4125
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@name"/> \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@minOccurs"/>..<xsl:value-of select="@maxOccurs"/> \cell}
{\pard \intbl \sb120\sa120\fs16 {\field{\*\fldinst {\fs16 HYPERLINK  \\l "<xsl:value-of select="@type"/>"}}{\fldrslt {\fs16\ul\cf1 <xsl:value-of select="@type"/>}}} \cell}
{\pard \intbl \sb120\sa120\fs16 see {\field{\*\fldinst {\fs16 HYPERLINK  \\l "<xsl:value-of select="../@name"/>"}}{\fldrslt {\fs16\ul\cf1 <xsl:value-of select="../@name"/>}}} \cell}
\row
}
</xsl:template>
	
<xsl:template match="a:Simple"  mode="inherited">
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2000
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2720
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx4125
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@name"/> \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@minOccurs"/>..<xsl:value-of select="@maxOccurs"/> \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@xstype"/> \cell}
{\pard \intbl \sb120\sa120\fs16 see {\field{\*\fldinst {\fs16 HYPERLINK  \\l "<xsl:value-of select="../@name"/>"}}{\fldrslt {\fs16\ul\cf1 <xsl:value-of select="../@name"/>}}} \cell}
\row
}
</xsl:template>

<xsl:template match="a:ComplexType">
{\par\b\fs24 {\*\bkmkstart <xsl:value-of select="@name"/>}<xsl:value-of select="@name"/>}{\fs32 {\*\bkmkend <xsl:value-of select="@name"/>}}<xsl:call-template name="complex_type" />
</xsl:template>

<xsl:template match="a:CompoundType">
{\par\b\fs24 {\*\bkmkstart <xsl:value-of select="@name"/>}<xsl:value-of select="@name"/>}{\fs32 {\*\bkmkend <xsl:value-of select="@name"/>}}
<xsl:apply-templates mode="annotate-type" />
\par\pard\plain \sb120\qj\fs20\lang1033 
{\par\b\fs20 Members\par}
\par
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2000
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx2720
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx4125
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16\qc\b name \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b mult \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b type \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b description \cell}
\row
}
<xsl:apply-templates select="a:Domain|a:Simple|a:Instance|a:Reference|a:Enumerated" />
</xsl:template>

<xsl:template match="a:SimpleType">
{\par\b\fs24 {\*\bkmkstart <xsl:value-of select="@name"/>}<xsl:value-of select="@name"/>}{\fs32 {\*\bkmkend <xsl:value-of select="@name"/>} \par}
<xsl:apply-templates mode="annotate" />
\par\pard\plain \sb120\qj\fs20\lang1033 XSD type: <xsl:value-of select="@xstype"/> 
\par\pard\plain \sb120\qj\fs20\lang1033 
</xsl:template>

<xsl:template match="a:EnumeratedType">
{\par\b\fs24 {\*\bkmkstart <xsl:value-of select="@name"/>}<xsl:value-of select="@name"/>}{\fs32 {\*\bkmkend <xsl:value-of select="@name"/>} \par}
<xsl:apply-templates mode="annotate" />
\par\pard\plain \sb120\qj\fs20\lang1033 
\par
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx3750
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16\qc\b name \cell}
{\pard \intbl \sb120\sa120\fs16\qc\b description \cell}
\row
}
<xsl:apply-templates />
</xsl:template>

<xsl:template match="a:EnumeratedValue">
{
\trowd \trgaph70 
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx3750
\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs
\cellx9500
{\pard \intbl \sb120\sa120\fs16 <xsl:value-of select="@name"/> \cell}
{\pard \intbl \sb120\sa120\fs16 <xsl:apply-templates mode="annotate-table-row" /> \cell}
\row
}
</xsl:template>

<!-- Templates for annotations supporting complex types... -->
<xsl:template match="a:Comment" mode="annotate-type">
{\par\pard\plain \sb120\qj\fs20\lang1033 <xsl:call-template name="replace-non-ascii"><xsl:with-param name="text" select="." /></xsl:call-template>}
</xsl:template>

<xsl:template match="a:Note" mode="annotate-type">
{\par\pard\plain \sb120\qj\fs20\lang1033 <xsl:call-template name="replace-non-ascii"><xsl:with-param name="text" select="." /></xsl:call-template>}
</xsl:template>

<xsl:template match="node()" mode="annotate-type">
</xsl:template>

<!-- Templates for annotations supporting standard table rows... -->
<xsl:template match="a:Comment" mode="annotate-table-row">
{\sb120\sa120 <xsl:call-template name="replace-non-ascii"><xsl:with-param name="text" select="." /></xsl:call-template>}
</xsl:template>

<xsl:template match="a:Note" mode="annotate-table-row">
{\sb120\sa120 <xsl:call-template name="replace-non-ascii"><xsl:with-param name="text" select="." /></xsl:call-template>}
</xsl:template>

<xsl:template match="node()" mode="annotate-table-row">
</xsl:template>

<!-- Default templates for annotations supporting annotations without formatting... -->
<xsl:template match="a:Comment" mode="annotate">
<xsl:call-template name="replace-non-ascii"><xsl:with-param name="text" select="." /></xsl:call-template>
</xsl:template>

<xsl:template match="a:Note" mode="annotate">
<xsl:call-template name="replace-non-ascii"><xsl:with-param name="text" select="." /></xsl:call-template>
</xsl:template>

<xsl:template match="node()" mode="annotate">
</xsl:template>

<xsl:template match="node()">
</xsl:template>

<xsl:template name="replace-non-ascii">
    <xsl:param name="text"/>
    <xsl:variable name="ascii"> !"#$%&amp;'()*+,-./0123456789:;=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{|}~</xsl:variable>
    <xsl:variable name="non-ascii" select="translate($text, $ascii, '')" />
    <xsl:choose>
        <xsl:when test="$non-ascii">
            <xsl:variable name="char" select="substring($non-ascii, 1, 1)" />
            <!-- <xsl:variable name="hex" select="java:java.lang.Integer.toHexString(java:java.lang.Integer.parseInt(java:java.lang.String.valueOf($char)))" /> -->
            <!-- <xsl:variable name="escaped" select="concat('\', $apos, $hex)" /> -->
            <xsl:variable name="escaped" select="concat('\', $apos, 'e2')" />
            <!-- recursive call -->
            <xsl:call-template name="replace-non-ascii">
                <xsl:with-param name="text" select="translate($text, $char, '')"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$text"/>
        </xsl:otherwise>
    </xsl:choose>   
</xsl:template>

</xsl:stylesheet>