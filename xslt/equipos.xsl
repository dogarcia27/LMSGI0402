<?xml version="1.0" encoding="UTF-8"?>

<!-- Espacio de nombres -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat"/>

<!-- Creamos una variable para seleccionar equipo en función del nombre del entrenador -->
<xsl:variable name="entrenador" select="'Julio Velasco'"/>

<!-- Plantilla principal: intercalamos código html con datos xml -->
<xsl:template match="/club_voleibol">
    <html lang="es">
        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta name="description" content="Página de equipos" />
            <title>titulo de la web</title>
        </head>
        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipos.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            <main>

            <!-- Mostramos la información de los equipos entrenados por el entrenador seleccionado -->
            <xsl:apply-templates select="equipo[entrenador/nombre=$entrenador]"/>
            </main>
            <footer>
                <address>&#169; Tarea Evaluativa 0402, por dogarcia@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>

<!-- Plantilla para mostrar la información que queremos de cada equipo -->
<xsl:template match="equipo">
    <h1>
        <a href="{entrenador/url}"><xsl:value-of select="entrenador/nombre"/></a>
    </h1>
    <article class="equipos">
        <h4><xsl:value-of select="nombre"/></h4>
        <xsl:apply-templates select="jugadores/jugador"/>          
    </article>
</xsl:template>

<!-- Plantilla para mostrar datos del jugador sólo si es titular -->
<xsl:template match="jugador">
    <xsl:if test="@titular='si'">
        <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>