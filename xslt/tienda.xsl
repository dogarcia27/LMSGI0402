<?xml version="1.0" encoding="UTF-8"?>

<!-- Espacio de nombres -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat"/>

<!-- Plantilla principal: intercalamos código html con datos xml -->
<xsl:template match="/club_voleibol/tienda">
    <html lang="es">

        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta name="description" content="Página de la tienda" />
            <title>Tienda del club de voleibol</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipos.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            <main class="principal">

            <!-- Utilizamos un for-each para recorrer cada articulo de la tienda -->
            <xsl:for-each select="articulo">
                <article>
                    <section>
                        <img class="articulo" src="{./@foto}" />			
                    </section>
                    <section>
                        <h2><xsl:value-of select="precio"/> €</h2>
                        <!-- Utilizamos la función count para que calcule el número de comentarios -->
                        <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
                        <ul>
                        <!-- Utilizando nuevamente un for-each al añadir comentarios en el xml de origen se actualizará la lista de comentarios -->
                        <xsl:for-each select="comentarios">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                        </ul>
                    </section>
                </article>
            </xsl:for-each>     
            </main>
            <footer>
                <address>&#169; Tarea Evaluativa 0402, por dogarcia@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>