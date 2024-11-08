<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Añadir Película</title>
                <link rel="stylesheet" href="pelicules.css"/>
            </head>
            <body>
                <h1>Añadir Nueva Película</h1>
                <!-- Formulario para añadir película -->
                <form id="formPelicula">
                    <label for="titol">Título:</label>
                    <input type="text" id="titol" name="titol" required="required"/>
                    
                    <label for="any">Año:</label>
                    <input type="number" id="any" name="any" required="required"/>
                    <label for="director">Director:</label>
                    <input type="text" id="director" name="director" required="required"/>
                    <label for="genere">Género:</label>
                    <input type="text" id="genere" name="genere" required="required"/>
                    <label for="sinopsi">Sinopsis:</label>
                    <textarea id="sinopsi" name="sinopsi" required="required"></textarea>
                    <label for="imatge">Imagen:</label>
                    <input type="file" id="imatge" name="imatge" accept="image/*" required="required"/>
                    <button type="button" onclick="guardarPelicula()">Guardar Película</button>
                </form>

                <script>
                    function guardarPelicula() {
                        // Obtenemos los datos del formulario
                        const titol = document.getElementById('titol').value;
                        const any = document.getElementById('any').value;
                        const director = document.getElementById('director').value;
                        const genere = document.getElementById('genere').value;
                        const sinopsi = document.getElementById('sinopsi').value;

                        // Guardar imagen en Base64
                        const imatgeInput = document.getElementById('imatge');
                        const reader = new FileReader();
                        reader.onload = function(event) {
                            const imatge = event.target.result;

                            // Crear objeto película
                            const pelicula = {
                                titol: titol,
                                any: any,
                                director: director,
                                genere: genere,
                                sinopsi: sinopsi,
                                imatge: imatge
                            };

                            // Guardar en localStorage (para simular el guardado)
                            let pelicules = JSON.parse(localStorage.getItem('pelicules')) || [];
                            pelicules.push(pelicula);
                            localStorage.setItem('pelicules', JSON.stringify(pelicules));

                            alert('Película guardada exitosamente.');
                            document.getElementById("formPelicula").reset();
                        };
                        reader.readAsDataURL(imatgeInput.files[0]); // Convertimos la imagen a Base64
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
