<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Plantilla de transformación de XML a HTML con estilo CSS -->
    <xsl:template match="/">
        <html lang="ca">
        <head>
            <meta charset="UTF-8"/>
            <title>Les meves pel·lícules favorites</title>
            <!-- Enlace al archivo CSS externo -->
            <link rel="stylesheet" href="pelicules.css"/>
        </head>
        <body>
            <!-- Cabecera de la página -->
            <header>
                <h1>Les meves pel·lícules favorites</h1>
                <p>Una selecció de pel·lícules que no em cansaria de veure.</p>
            </header>

            <!-- Contenedor principal de las películas -->
            <main>
                <section class="fitxes-pellicules">
                    <!-- Bucle para cada película en el XML -->
                    <xsl:for-each select="pelicules/pelicula">
                        <article class="fitxa">
                            <!-- Imagen de la película con atributos de fuente y descripción -->
                            <img>
                                <!-- Fuente de la imagen desde el campo imatge del XML -->
                                <xsl:attribute name="src">
                                    <xsl:value-of select="imatge"/>
                                </xsl:attribute>
                                <!-- Texto alternativo con el título de la película -->
                                <xsl:attribute name="alt">
                                    <xsl:text>Pòster de </xsl:text>
                                    <xsl:value-of select="titol"/>
                                </xsl:attribute>
                            </img>

                            <!-- Título de la película -->
                            <h2><xsl:value-of select="titol"/></h2>

                            <!-- Información de género -->
                            <p>
                                <strong>Gènere:</strong> <xsl:value-of select="genere"/>
                            </p>
                            
                            <!-- Información del año -->
                            <p>
                                <strong>Any:</strong> <xsl:value-of select="any"/>
                            </p>
                            
                            <!-- Información del director -->
                            <p>
                                <strong>Director:</strong> <xsl:value-of select="director"/>
                            </p>
                            
                            <!-- Sinopsis de la película -->
                            <p class="sinopsi">
                                <xsl:value-of select="sinopsi"/>
                            </p>
                        </article>
                    </xsl:for-each>
                </section>
            </main>

            <!-- Pie de página -->
            <footer>
                <p>© 2023 Les meves pel·lícules favorites</p>
            </footer>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>