<?xml version="1.0" encoding="UTF-8"?>
<!-- Declaració del tipus de document XML i la seva codificació. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Definició d'un full d'estils XSLT que transformarà el contingut XML a HTML. -->
    
    <xsl:template match="/">
        <!-- El primer element de la transformació, s'aplica a l'arrel del document XML. -->
        
        <html lang="ca">
        <!-- Comença el document HTML amb el llenguatge configurat a "ca" (català). -->
        
        <head>
        <!-- Comença la capçalera del document HTML. -->
            <meta charset="UTF-8"/>
            <!-- Estableix la codificació de caràcters del document com UTF-8. -->
            <title>Les meves pel·lícules favorites</title>
            <!-- Defineix el títol que apareixerà a la pestanya del navegador. -->
            
            <!-- Enllaç a un fitxer extern de CSS per aplicar estils. -->
            <link rel="stylesheet" href="pelicules.css"/>
            
            <script>
            <!-- Comença el bloc de codi JavaScript. -->
            
            // Funció per desplegar/ocultar la sinopsis quan es fa clic en una pel·lícula.
            function toggleSynopsis(event) {
                const currentFitxa = event.currentTarget;
                <!-- Obtenim l'element "fitxa" que s'ha clicat. -->
                
                // Tanca qualsevol altra fitxa que estigui expandida.
                document.querySelectorAll(".fitxa.expandida").forEach(fitxa => {
                    if (fitxa !== currentFitxa) {
                        fitxa.classList.remove("expandida");
                        fitxa.querySelector(".sinopsi").style.display = "none";
                    }
                });

                // Alterna el desplegament de la sinopsi de la fitxa clicada.
                const synopsis = currentFitxa.querySelector(".sinopsi");
                if (synopsis.style.display === "none" || synopsis.style.display === "") {
                    currentFitxa.classList.add("expandida");
                    synopsis.style.display = "block";
                } else {
                    currentFitxa.classList.remove("expandida");
                    synopsis.style.display = "none";
                }
            }

            // Un cop es carrega el document, afegim l'esdeveniment de clic a cada fitxa.
            document.addEventListener("DOMContentLoaded", () => {
                const movies = document.querySelectorAll(".fitxa");
                movies.forEach(movie => {
                    movie.addEventListener("click", toggleSynopsis);
                });
            });
            <!-- Final del codi JavaScript. -->

            </script>

        </head>
        
        <body>
        <!-- Comença el cos del document HTML. -->
        
            <!-- Cabecera de la pàgina -->
            <header>
                <h1>Les meves pel·lícules favorites</h1>
                <!-- Títol principal de la pàgina, és el nom del lloc. -->
                <p>Una selecció de pel·lícules que no em cansaria de veure.</p>
                <!-- Descripció breu de la pàgina. -->
            </header>

            <!-- Contenidor principal de les pel·lícules -->
            <main>
                <section class="fitxes-pellicules">
                <!-- Contenidor que agrupa totes les fitxes de les pel·lícules. -->

                    <!-- Bucle que recorre cada pel·lícula del XML per mostrar les dades. -->
                    <xsl:for-each select="pelicules/pelicula">
                        <article class="fitxa">
                        <!-- Per cada pel·lícula, es crea una nova "fitxa" (article) dins del contingut. -->
                        
                            <!-- Imatge de la pel·lícula -->
                            <img>
                                <!-- Atribut "src" per la ruta de la imatge des del XML. -->
                                <xsl:attribute name="src">
                                    <xsl:value-of select="imatge"/>
                                </xsl:attribute>
                                <!-- Atribut "alt" per descriure la imatge (pòster de la pel·lícula). -->
                                <xsl:attribute name="alt">
                                    <xsl:text>Pòster de </xsl:text>
                                    <xsl:value-of select="titol"/>
                                </xsl:attribute>
                            </img>

                            <!-- Títol de la pel·lícula -->
                            <h2><xsl:value-of select="titol"/></h2>
                            <!-- Es mostra el títol de la pel·lícula extret del camp "titol" del XML. -->

                            <!-- Informació sobre el gènere -->
                            <p>
                                <strong>Gènere:</strong> <xsl:value-of select="genere"/>
                            </p>
                            <!-- Es mostra el gènere de la pel·lícula, extret del camp "genere" del XML. -->
                            
                            <!-- Informació sobre l'any -->
                            <p>
                                <strong>Any:</strong> <xsl:value-of select="any"/>
                            </p>
                            <!-- Es mostra l'any de la pel·lícula, extret del camp "any" del XML. -->
                            
                            <!-- Informació sobre el director -->
                            <p>
                                <strong>Director:</strong> <xsl:value-of select="director"/>
                            </p>
                            <!-- Es mostra el nom del director de la pel·lícula, extret del camp "director" del XML. -->
                            
                            <!-- Sinopsi de la pel·lícula -->
                            <p class="sinopsi" style="display: none">
                                <xsl:value-of select="sinopsi"/>
                            </p>
                            <!-- Es mostra la sinopsi de la pel·lícula, inicialment oculta amb "display: none". -->
                        </article>
                    </xsl:for-each>
                    <!-- Fi del bucle que repeteix per a cada pel·lícula. -->
                </section>
                <!-- Botón para abrir la página de añadir película -->
                <a href="formulario.xml">
                    <button>Añadir Película</button>
                </a>

            </main>
            <!-- Peu de pàgina -->
            <footer>
                <p>© 2023 Les meves pel·lícules favorites</p>
                <!-- Text de crèdit a peu de pàgina. -->
            </footer>
        
        </body>
        </html>
    </xsl:template>
    <!-- Fi del template XSLT per transformar l'XML. -->
</xsl:stylesheet>
