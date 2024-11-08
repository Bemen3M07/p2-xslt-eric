<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html lang="ca">
            <head>
                <meta charset="UTF-8"/>
                <title>Les meves pel·lícules favorites</title>
                <link rel="stylesheet" href="pelicules.css"/>
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        // Cargar las películas desde localStorage
                        const peliculesLocal = JSON.parse(localStorage.getItem("pelicules")) || [];
                        const fitxesPellicules = document.querySelector(".fitxes-pellicules");

                        // Función para eliminar una película de localStorage
                        function eliminarPelicula(index) {
                            peliculesLocal.splice(index, 1); // Elimina la película en la posición index
                            localStorage.setItem("pelicules", JSON.stringify(peliculesLocal)); // Actualiza localStorage
                            location.reload(); // Recarga la página para reflejar los cambios
                        }

                        // Insertar las películas almacenadas en localStorage
                        peliculesLocal.forEach((pelicula, index) => {
                            const fitxa = document.createElement("article");
                            fitxa.classList.add("fitxa");

                            const img = document.createElement("img");
                            img.setAttribute("src", pelicula.imatge);
                            img.setAttribute("alt", "Pòster de " + pelicula.titol);

                            const h2 = document.createElement("h2");
                            h2.textContent = pelicula.titol;

                            const genereP = document.createElement("p");
                            genereP.innerHTML = "<strong>Gènere:</strong> " + pelicula.genere;

                            const anyP = document.createElement("p");
                            anyP.innerHTML = "<strong>Any:</strong> " + pelicula.any;

                            const directorP = document.createElement("p");
                            directorP.innerHTML = "<strong>Director:</strong> " + pelicula.director;

                            const sinopsiP = document.createElement("p");
                            sinopsiP.innerHTML = "<strong>Sinopsi:</strong>" + pelicula.sinopsi;

                            const deleteButton = document.createElement("button");
                            deleteButton.textContent = "Borrar";
                            deleteButton.classList.add("delete-button");
                            deleteButton.addEventListener("click", function(e) {
                                e.stopPropagation(); // Evitar que el evento de clic se propague al contenedor de la película
                                eliminarPelicula(index);
                            });

                            fitxa.appendChild(img);
                            fitxa.appendChild(h2);
                            fitxa.appendChild(genereP);
                            fitxa.appendChild(anyP);
                            fitxa.appendChild(directorP);
                            fitxa.appendChild(sinopsiP);
                            fitxa.appendChild(deleteButton);

                            fitxesPellicules.appendChild(fitxa);
                        });
                    });
                    document.addEventListener("DOMContentLoaded", function() {
                        mostrarPeliculas();
                    });

                    

                </script>
            </head>
            <body>
                <header>
                    <h1>Les meves pel·lícules favorites</h1>
                    <p>Una selecció de pel·lícules que no em cansaria de veure.</p>
                </header>

                <main>
                    <section class="fitxes-pellicules">
                        <!-- Las películas se cargarán dinámicamente aquí -->
                        <xsl:for-each select="pelicules/pelicula">
                            <article class="fitxa">
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="imatge"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:text>Pòster de </xsl:text>
                                        <xsl:value-of select="titol"/>
                                    </xsl:attribute>
                                </img>

                                <h2><xsl:value-of select="titol"/></h2>
                                <p>
                                    <strong>Gènere:</strong> <xsl:value-of select="genere"/>
                                </p>
                                <p>
                                    <strong>Any:</strong> <xsl:value-of select="any"/>
                                </p>
                                <p>
                                    <strong>Director:</strong> <xsl:value-of select="director"/>
                                </p>
                                <p class="sinopsi">
                                    <xsl:value-of select="sinopsi"/>
                                </p>

                                <!-- Botón de borrar -->
                                <button id="delete-bttn" onclick="eliminarPeliculaXSL()">Borrar</button>
                            </article>
                        </xsl:for-each>
                    </section>

                    
                </main>
                <a href="formulario.xml">
                    <button id="AfegirPelicula">Añadir Película</button>
                </a>
                <footer>
                    <p>© 2023 Les meves pel·lícules favorites</p>
                </footer>

                <script>
                    function eliminarPeliculaXSL() {
                        alert("Funcionalidad aún no implementada para eliminar del XML.");
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>