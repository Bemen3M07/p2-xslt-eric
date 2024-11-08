<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Añadir Película</title>
                <style>
                    /* Añadir estilos aquí */
                    body { font-family: Arial, sans-serif; padding: 20px; }
                    form { max-width: 400px; margin: 0 auto; }
                    label { display: block; margin: 8px 0 4px; }
                    input, textarea { width: 100%; padding: 8px; }
                    button { margin-top: 10px; padding: 8px 16px; }
                </style>
            </head>
            <body>
                <h1>Añadir Nueva Película</h1>
                <form action="guardar_pelicula.php" method="post" enctype="multipart/form-data">
                    <label for="titol">Título:</label>
                    <input type="text" id="titol" name="titol" required/>

                    <label for="any">Año:</label>
                    <input type="number" id="any" name="any" required/>

                    <label for="director">Director:</label>
                    <input type="text" id="director" name="director" required/>

                    <label for="genere">Género:</label>
                    <input type="text" id="genere" name="genere" required/>

                    <label for="sinopsi">Sinopsis:</label>
                    <textarea id="sinopsi" name="sinopsi" required></textarea>

                    <label for="imatge">Foto:</label>
                    <input type="file" id="imatge" name="imatge" accept="image/*" required/>

                    <button type="submit">Guardar</button>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>