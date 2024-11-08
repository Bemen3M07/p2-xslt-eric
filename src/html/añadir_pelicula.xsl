<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Añadir Película</title>
                <style>
                    /* Estilos del formulario */
                    body { font-family: Arial, sans-serif; padding: 20px; }
                    form { max-width: 400px; margin: 0 auto; }
                    label { display: block; margin: 8px 0 4px; }
                    input, textarea { width: 100%; padding: 8px; }
                    button { margin-top: 10px; padding: 8px 16px; }
                </style>
            </head>
            <body>
                <h1>Añadir Nueva Película</h1>
                <!-- Formulario para añadir película -->
                <form id="formPelicula">
                    <label for="titol">Título:</label>
                    <input type="text" id="titol" name="titol" />
                    
                    <label for="any">Año:</label>
                    <input type="number" id="any" name="any" />
                    <label for="director">Director:</label>
                    <input type="text" id="director" name="director" />
                    <label for="genere">Género:</label>
                    <input type="text" id="genere" name="genere" />
                    <label for="sinopsi">Sinopsis:</label>
                    <textarea id="sinopsi" name="sinopsi" ></textarea>
                    <label for="imatge">Imagen:</label>
                    <input type="file" id="imatge" name="imatge" accept="image/*"/>
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
