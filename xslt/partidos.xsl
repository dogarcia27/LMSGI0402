<?xml version="1.0" encoding="UTF-8"?>

<!-- Espacio de nombres -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat"/>

<!-- Creamos una variable para seleccionar equipo en función del nombre del entrenador -->
<xsl:variable name="vciudad" select="'Lima'"/>

<!-- Plantilla principal: intercalamos código html con datos xml -->
<xsl:template match="/club_voleibol">
    <html lang="es">

        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta name="description" content="Página de partidos jugados" />
            <title>Partidos de volleyball jugados</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipos.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            <main>
                <h1>PARTIDOS</h1>
                
                <table>
                    <tr>
                        <th>PARTIDO</th>
                        <th>FECHA</th>
                        <th>RESULTADO</th>
                    </tr>
                    <xsl:for-each select="partido[lugar/@ciudad=$vciudad]">
                    <xsl:sort order="descending" select="fecha"/>
                        <tr>
                            <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
                            <td><xsl:value-of select="fecha"/></td>
                            <xsl:if test="equipos/visitante/@puntuacion>equipos/local/@puntuacion">
                                <td class="azul"><xsl:value-of select="//local/@puntuacion"/> - <xsl:value-of select="//visitante/@puntuacion"/></td>
                            </xsl:if>
                            <xsl:if test="equipos/local/@puntuacion>equipos/visitante/@puntuacion">
                                <td><xsl:value-of select="//local/@puntuacion"/> - <xsl:value-of select="//visitante/@puntuacion"/></td>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                </table>			
            </main>
            <footer>
                <address>&#169; Tarea Evaluativa 0402, por dogarcia@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>