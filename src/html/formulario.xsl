<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Añadir Película</title>
                <link rel="stylesheet" href="pelicules.css"/>
            </head>
            <body>
            <header><h1>Añadir Nueva Película</h1></header>
                <main>
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
                <!-- Formulario para añadir película -->
                </main>           
                
                <section id="PeliculasRegistradas">
                <h2>Películas Registradas</h2>
                <p id="mensajeSinPeliculas">No hi han pelicules afegides encara</p> <!-- Mensaje predeterminado -->
                <div id="peliculas-lista" class="fitxes-pellicules"></div> <!-- Contenedor de películas -->
                
                <script>
                    // Función para mostrar películas desde localStorage
                    function mostrarPeliculas() {
                        let peliculas = JSON.parse(localStorage.getItem('pelicules')) || [];
                        const lista = document.getElementById('peliculas-lista');
                        const mensaje = document.getElementById('mensajeSinPeliculas');
                        
                        if (peliculas.length === 0) {
                            mensaje.style.display = 'block'; // Mostrar mensaje si no hay películas
                            lista.innerHTML = ''; // Limpiar la lista de películas
                        } else {
                            mensaje.style.display = 'none'; // Ocultar mensaje si hay películas
                            lista.innerHTML = ''; // Limpiar la lista de películas

                            peliculas.forEach(function(pelicula) {
                                const divPelicula = document.createElement('div');
                                divPelicula.classList.add('fitxa'); // Añadir clase CSS de la película

                                divPelicula.innerHTML = `
                                    <img src= "${pelicula.imatge}" alt="Imagen de ${pelicula.titol}" width="100" />
                                    <h2>${pelicula.titol} (${pelicula.any})</h2>
                                    <p><strong>Director:</strong> ${pelicula.director}</p>
                                    <p><strong>Género:</strong> ${pelicula.genere}</p>
                                    <p class="sinopsi"><strong>Sinopsis:</strong> ${pelicula.sinopsi}</p>
                                `;
                                lista.appendChild(divPelicula);
                            });
                        }
                    }

                    // Función para guardar película en localStorage
                    function guardarPelicula() {
                        const titol = document.getElementById('titol').value;
                        const any = document.getElementById('any').value;
                        const director = document.getElementById('director').value;
                        const genere = document.getElementById('genere').value;
                        const sinopsi = document.getElementById('sinopsi').value;

                        const imatgeInput = document.getElementById('imatge');
                        const reader = new FileReader();
                        reader.onload = function(event) {
                            const imatge = event.target.result; // Convertir la imagen a Base64
                            console.log("Imagen en Base64:", imatge); // Agrega esta línea para depurar

                            const pelicula = {
                                titol: titol,
                                any: any,
                                director: director,
                                genere: genere,
                                sinopsi: sinopsi,
                                imatge: imatge
                            };

                            // Obtener películas almacenadas y agregar la nueva
                            let peliculas = JSON.parse(localStorage.getItem('pelicules')) || [];
                            peliculas.push(pelicula);
                            localStorage.setItem('pelicules', JSON.stringify(peliculas));

                            alert('Película guardada exitosamente.');

                            // Limpiar el formulario
                            document.getElementById("formPelicula").reset();

                            // Mostrar las películas actualizadas
                            mostrarPeliculas();
                        };
                        reader.readAsDataURL(imatgeInput.files[0]); // Convertir la imagen a Base64
                    }

                    // Cargar las películas cuando se carga la página
                    window.onload = mostrarPeliculas;
                </script>
            </section>

                <button id="atras" onclick="window.history.back()">Atrás</button>
                <footer>
                    <p>© 2023 Les meves pel·lícules favorites</p>
                </footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>