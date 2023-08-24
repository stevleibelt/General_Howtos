# Define variable declaration XSL-FO

```xml
<!-- simple creation -->
<xsl:variable name="my_variable">my_value</xsl:variable>

<!-- set default value if no value is set / define variable if does not exist -->
<xsl:variable name="my_possible_undefined_variable">
    <xsl:choose>
        <!-- if content of variable is not an empty string -->
        <xsl:when test="my_possible_undefined_variable != ''">
            <!-- we need to set the already defined value since xsl:when is needed inside a xsl:choose -->
            <xsl:value-of select="my_possible_undefined_variable" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="'my default value'" />
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
```
