// Hacer copia de seguridad BD
// mysqldump --user=root myvideogamelist > myvideogamelist_copia.sql

// Recuperar copia de seguridad
// mysql --user=root < myvideogamelist_copia.sql

// ####################################################################################################################
// ####################################################################################################################
// => CLASES

// ####################################################################################################################
// *** clase VideogamesLibrary
// {Biblioteca de videojuegos} Clase en la cuál se almacenarán los videojuegos
// -> Constructor
function VideogamesLibrary() {
    this.list = new Array();
}

// -> Métodos
// Método para determinar si la biblioteca está o no vacía
// Devuelve un boolean
VideogamesLibrary.prototype.isEmpty = function () {
    return this.list.length == 0;
}

// Método para añadir un videojuego a la biblioteca
VideogamesLibrary.prototype.add = function (Videogame) {
    // Se añade el videojuego a la propiedad list (Array) como último elemento 
    this.list.push(Videogame);
}

// Método para eliminar un videojuego de la biblioteca. Recibe como parámetro el ID del videojuego
VideogamesLibrary.prototype.remove = function (videogameID) {
    let i = 0;
    let found = false;
    // Si se encuentra el ID en la lista se eliminará el videojuego
    // La busqueda seguirá mientras el contador sea menor que el tamaño del Array 
    // y no se haya encontrado un videojuego con el ID que recibe por parámetro
    while (i < this.list.length && !found) {
        if (this.list[i].id === videogameID) {
            found = true;

            this.list.splice(i, 1);
        }

        i++;
    }
}

// Método para eliminar todos lo videojuegos de la biblioteca
VideogamesLibrary.prototype.removeAll = function () {
    this.list.length = 0;
}

VideogamesLibrary.prototype.getByID = function (videogameID) {
    let i = 0;
    let found = false;
    // Si se encuentra el ID en la lista se eliminará el videojuego
    // La busqueda seguirá mientras el contador sea menor que el tamaño del Array 
    // y no se haya encontrado un videojuego con el ID que recibe por parámetro
    while (i < this.list.length && !found) {
        if (this.list[i].id === videogameID) {
            var videogame = this.list[i];

            found = true;
        }

        i++;
    }

    return videogame;
}

// Método para buscar videojuegos por nombre
// Recibe por parámetro un string
// Devuelve un objeto de la clase VideogamesLibrary que contiene las coincidencias encontradas
VideogamesLibrary.prototype.getGroupByName = function (string) {
    // Se fuerza a que el parámetro recibido sea un string
    let txt = new String(string);

    // Se instancia un objeto de la clase VideogamesLibrary()
    let libraryCoincidences = new VideogamesLibrary();

    // Se recorre la biblioteca
    for (var i = 0; i < this.list.length; i++) {
        // Si el nombre de un videojuego contiene el string que se recibe por parámetro, se añade el videojuego
        // a la nueva biblioteca previamente instanciada
        // (Se convierten a mayúsculas tanto la propiedad del objeto como el string recibido)
        if (this.list[i].name.toUpperCase().includes(txt.toUpperCase())) {
            libraryCoincidences.list.push(this.list[i]);
        }
    }

    // Se retorna la nueva biblioteca con las coincidencias encontradas
    return libraryCoincidences;
}

// Método para ordenar la biblioteca por nombre
VideogamesLibrary.prototype.sortByName = function () {
    // Para comparar los objetos dentro de un Array pasamos al método sort una función de apoyo por parámetro
    // Dicha función comparará dos objetos del array en cada llamada
    this.list.sort(function (a, b) { // {Función anónima}
        // Primero forzamos que las propiedades name sean String
        let nameA = new String(a.name);
        let nameB = new String(b.name);
        // Como resultado la función devolverá...
        // ... un valor positivo si el primer valor es superior al segundo
        // ... un valor negativo si el primer valor es inferior al segundo
        // ... un valor cero si los dos valores son iguales o equivalentes para la ordenación.
        // Para comparar los String name de la clase Videogame utilizaré la función String.prototype.localCompare()
        // para evitar problemas con los caracteres especiales. Además no hará distinción entre mayúsculas y minúsculas
        return nameA.localeCompare(nameB);
    });
}

// ####################################################################################################################
// *** clase Videogame
// {Videojuego}
// -> Constructor
function Videogame(id, name, genre, developer, publisher, platform, rating, image, score, sinceDate) {
    this.id = id;
    this.name = name; // nombre
    this.genre = genre; // genero/s
    this.developer = developer; // empresa desarrolladora
    this.publisher = publisher; // empresa editora
    this.platform = platform; // plataforma/s
    this.rating = parseInt(rating); // calificación de edad
    this.image = image; // imagen
    this.score = score; // valoracion
    this.sinceDate = new Date(sinceDate);// fecha en la que se añade el videojuego a la biblioteca
}

Videogame.prototype.addScore = function (gameplay, graphics, art, sound, narrative, multiplayer) {
    gameplay = parseFloat(gameplay);
    graphics = parseFloat(graphics);
    art = parseFloat(art);
    sound = parseFloat(sound);

    if (narrative != null) {
        narrative = parseFloat(narrative);
    }

    if (multiplayer != null) {
        multiplayer = parseFloat(multiplayer);
    }

    this.score = {
        gameplay: gameplay,
        graphics: graphics,
        art: art,
        sound: sound,
        narrative: narrative,
        multiplayer: multiplayer
    }
}

Videogame.prototype.getAvgScore = function () {
    let scores = Object.values(this.score);
    let sum = 0; // acumulador de sumas
    let count = 0; // contador
    let score, avg;

    for (let i = 0; i < scores.length; i++) {
        score = scores[i];

        if (score != null) {
            sum += score;
            count++;
        }
    }

    avg = sum / count; // nota media

    return Math.round(avg * 10);
}

var library = new VideogamesLibrary();
var sort = false;
var animationEnd = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";

$(document).ready(function () {
    var output = $('#videogames-output');
    var outputScore = $('#videogame-score');
    var videogameCardModel = $('#videogame-card');
    var scoreContainerModel = $('#videogame-score-container');
    var newVideogameModal = $('#new-videogame-modal');
    var showVideogameModal = $('#show-videogame-modal');
    var removeVideogameModal = $('#remove-videogame-modal');
    var newVideogameForm = $('form[name="new-videogame-form"]');
    var newScoreForm = $('form[name="score-videogame-form"]');
    var scoreAccordion = $('#score-videogame-sections');
    var searchByNameForm = $('form[name="search-by-name-form"]');
    var gameplayScoreInput = $('#gameplay-score-field');
    var graphicsScoreInput = $('#graphics-score-field');
    var artScoreInput = $('#art-score-field');
    var soundScoreInput = $('#sound-score-field');
    var narrativeScoreInput = $('#narrative-score-field');
    var multiplayerScoreInput = $('#multiplayer-score-field');
    var imagePreview = $('#videogame-image-preview');
    const FORBIDDEN_KEY_CODES = [
        9, 16, 17, 18, 19, 20, 27, 33, 34, 35, 36, 37,
        38, 39, 40, 45, 91, 92, 93, 112, 113, 114, 115,
        116, 117, 118, 119, 120, 121, 122, 123, 144, 145
    ];

    getAllVideogames();

    // Eventos
    showVideogameModal.on('show.bs.modal', function () {
        let videogameID = $(this)[0].dataset.videogameId;
        let videogame = library.getByID(videogameID);

        fillData(videogame);
    });

    removeVideogameModal.on('show.bs.modal', function () {
        let videogameID = $(this)[0].dataset.videogameId;
        let videogame = library.getByID(videogameID);
        let videogameName = videogame.name;

        $(this).find('.title').text('ELIMINAR ' + videogameName);
        $(this).find('.modal-body p').text('¿Seguro que quieres eliminar ' + videogameName + ' de tu lista?');
        $('#remove-videogame-button').click(function () {
            removeVideogame(videogameID);
        });
    });

    newVideogameModal.find('button[type="reset"]').click(function () {
        imagePreview.attr('src', 'img/videogames/no-image-min.png');
    });

    newVideogameForm.submit(function (e) {
        e.preventDefault();
        addVideogame(getVideogameDataFormValues());
    });

    newScoreForm.submit(function (e) {
        let videogameID;

        e.preventDefault();
        videogameID = showVideogameModal[0].dataset.videogameId;
        addVideogameScore(videogameID, getScoreFormValues());
    })

    searchByNameForm.submit(function (e) {
        e.preventDefault();
    });

    $('#search-input').keyup(function (e) {
        let forbidden = isForbiddenKey(e.keyCode);
        let search = $(this).val();

        if (search.length == 0 && !forbidden) {
            library.isEmpty() ? showEmptyLibraryMessage() : drawVideogamesLibrary(library, "fadeIn");
        } else if (search.length != 0 && !forbidden) {
            let librarySearch = library.getGroupByName(search);

            $([document.documentElement, document.body]).animate({
                scrollTop: 0
            }, 1000);

            librarySearch.isEmpty() ? showNoMatchNamesMessage(search) : drawVideogamesLibrary(librarySearch, "fadeIn");
        }
    });

    $('#remove-all-videogames-button').click(function () {
        removeAllVideogames();
    });

    // Funciones

    function drawVideogamesLibrary(VideogamesLibrary, animation) {
        output.empty();

        VideogamesLibrary.list.forEach(function (videogame) {
            drawVideogameCard(videogame, animation);
        });
    }

    function drawVideogameCard(Videogame, animation) {
        let videogameCard = cloneNodeElement(videogameCardModel);
        let videogameID = Videogame.id;
        let videogameName = Videogame.name;

        videogameCard.attr('id', videogameID);
        videogameCard.find('.videogame-image').attr("title", videogameName).find('img').attr({
            src: Videogame.image,
            alt: "Imagen de " + videogameName
        });
        videogameCard.find('.videogame-info .text-truncate').text(videogameName);
        videogameCard.find('.show-button').click(function () {
            showVideogameModal.attr('data-videogame-id', videogameID);
        });
        videogameCard.find('.remove-button').click(function () {
            removeVideogameModal.attr('data-videogame-id', videogameID);
        });
        output.append(videogameCard);
        videogameCard.addClass('animated ' + animation).removeClass('no-display').one(animationEnd, function () {
            $(this).removeClass('animated ' + animation);
        });
    }

    // Función para clonar elementos del DOM
    function cloneNodeElement(originalNode) {
        let copyNode = originalNode.clone();
        copyNode.attr('id', '');

        return copyNode;
    }

    function fillData(Videogame) {
        let videogameName = Videogame.name;
        let videogameGenre = Videogame.genre;
        let videogameDeveloper = Videogame.developer;
        let videogamePublisher = Videogame.publisher;
        let videogameSinceDate = Videogame.sinceDate;
        let sinceDate = videogameSinceDate.getDate() + "-" + (videogameSinceDate.getMonth() + 1) + "-" + videogameSinceDate.getFullYear();

        $('#videogame-title').text(Videogame.name);
        $('#videogame-since-date').html('En tu colección desde el <em><time>' + sinceDate + '</time></em>');
        $('#videogame-image').attr({
            src: Videogame.image,
            alt: "Imagen de " + videogameName,
            title: videogameName
        });
        $('#videogame-name').text(videogameName);

        if (videogameGenre.length) {
            let outputSpan = $('<span>');

            $.each(videogameGenre, function (i) {
                let span = $('<span>');

                span.text(videogameGenre[i]).addClass('badge badge-secondary');
                outputSpan.append(span).append(" ");
            });

            $('#videogame-genre').html(outputSpan);
        }else{
            $('#videogame-genre').empty();
        }

        $('#videogame-developer').text(videogameDeveloper.join(", "));
        $('#videogame-publisher').text(videogamePublisher.join(", "));
        $('#videogame-platform').text(Videogame.platform.join(", "));
        $('#videogame-rating').text(Videogame.rating);
        $('#score-videogame-sections-button').text("Valorar " + videogameName);

        outputScore.empty();
        scoreContainerModel.addClass('no-display');

        if (!($.isEmptyObject(Videogame.score))) {
            fillScoreData(Videogame);
        }
    }

    function fillScoreData(Videogame) {
        let narrativeScore = Videogame.score.narrative;
        let multiplayerScore = Videogame.score.multiplayer;
        let avgScore = Videogame.getAvgScore();
        let bgColor;

        if (avgScore < 50) {
            bgColor = "#ff0000";
        } else if (avgScore >= 80) {
            bgColor = "#6c3";
        } else {
            bgColor = "#ffcc33";
        }

        if (narrativeScore == null) {
            narrativeScore = "-";
        }

        if (multiplayerScore == null) {
            multiplayerScore = "-"
        }

        outputScore.html(scoreContainerModel);

        scoreContainerModel.find('.score-box').css('background-color', bgColor).text(avgScore);

        $("#gameplay-score").html(Videogame.score.gameplay);
        $("#graphics-score").html(Videogame.score.graphics);
        $("#art-score").html(Videogame.score.art);
        $("#sound-score").html(Videogame.score.sound);
        $("#narrative-score").html(narrativeScore);
        $("#multiplayer-score").html(multiplayerScore);

        scoreContainerModel.addClass('animated rubberBand').removeClass('no-display').one(animationEnd, function () {
            $(this).removeClass('animated rubberBand');
        });
    }

    // Mensaje en caso de que no haya ningún videojuego en la biblioteca
    function showEmptyLibraryMessage() {
        let div = $('<div>');
        let h3 = $('<h3>');

        div.addClass('d-flex flex-wrap justify-content-center my-5 mx-auto p-5 animated zoomInRight').one(animationEnd, function () {
            $(this).removeClass('animated zoomInRight');
        });
        h3.html('No has añadido ningún videojuego a tu <span class="title">biblioteca</span>').addClass('text-center');
        div.append(h3);
        output.html(div);
    }

    // Mensaje en caso de que no haya ninguna coincidencia en la búsqueda
    function showNoMatchNamesMessage(name) {
        let div = $('<div>');
        let h4 = $('<h4>');

        div.addClass('d-flex flex-wrap justify-content-center my-5 mx-auto p-5 animated fadeIn').one(animationEnd, function () {
            $(this).removeClass('animated fadeIn');
        });
        h4.html('<strong>No se ha encontrado ninguna coincidencia para: </strong> ' + name).addClass('text-center');
        div.append(h4);
        output.html(div);
    }


    function isForbiddenKey(eventkeyCode) {
        let found = false;
        let i = 0;

        while (i < FORBIDDEN_KEY_CODES.length && !found) {
            if (eventkeyCode === FORBIDDEN_KEY_CODES[i++]) {
                found = true;
            }
        }

        return found;
    }
    // ####################################################################################################################
    // ####################################################################################################################
    // => FORMULARIOS

    // Función necesaria para añadir un videojuego a partir de los datos obtenidos de un formulario
    function getVideogameDataFormValues() {
        let name = $('#videogame-name-input').val();
        let developer = $('#videogame-developer-input').val();
        let publisher = $('#videogame-publisher-input').val();
        let platform = $('#videogame-platform-input').val();
        let rating = parseInt(newVideogameForm.find($('input[name="videogame-rating-input"]:checked')).val());
        let images = $('#videogame-image-chooser').prop('files');
        let genres = new Array();
        let genre, image;

        newVideogameForm.find($('input[name="videogame-genre-input"]:checked')).each(function (i) {
            genres[i] = $(this).val();
        });

        developer === "" ? developer = "" : developer = developer.split(", ");
        publisher === "" ? publisher = "" : publisher = publisher.split(", ");
        platform === "" ? platform = "" : platform = platform.split(", ");
        genres.length ? genre = genres : genre = "";
        images.length ? image = images[0].name : image = "";

        return {
            name: name,
            genre: genre,
            developer: developer,
            publisher: publisher,
            platform: platform,
            rating: rating,
            image: image
        };
    }

    // Función necesaria para añadir una valoración a un videojuego a partir
    // de los datos obtenidos de un formulario
    function getScoreFormValues() {
        let videogameType = newScoreForm.find($('input[name="videogame-type"]:checked')).val();
        let gameplay = gameplayScoreInput.val();
        let graphics = graphicsScoreInput.val();
        let art = artScoreInput.val();
        let sound = soundScoreInput.val();
        let narrative = narrativeScoreInput.val();
        let multiplayer = multiplayerScoreInput.val();

        gameplay = parseFloat(new Number(gameplay).toFixed(2));
        graphics = parseFloat(new Number(graphics).toFixed(2));
        art = parseFloat(new Number(art).toFixed(2));
        sound = parseFloat(new Number(sound).toFixed(2));

        if (videogameType == "single") {
            narrative = parseFloat(new Number(narrative).toFixed(2));
            multiplayer = null;
        } else if (videogameType == "multi") {
            multiplayer = parseFloat(new Number(multiplayer).toFixed(2));
            narrative = null;
        } else {
            narrative = parseFloat(new Number(narrative).toFixed(2));
            multiplayer = parseFloat(new Number(multiplayer).toFixed(2));
        }

        return {
            gameplay: gameplay,
            graphics: graphics,
            art: art,
            sound: sound,
            narrative: narrative,
            multiplayer: multiplayer
        };
    }


    // AJAX

    function addVideogame(videogame) {
        let promise = new Promise(function (resolve) {
            resolve(
                $.ajax({
                    type: "POST",
                    url: "php/addVideogame.php",
                    data: {
                        "name": videogame.name,
                        "genre": videogame.genre,
                        "developer": videogame.developer,
                        "publisher": videogame.publisher,
                        "platform": videogame.platform,
                        "rating": videogame.rating,
                        "image": videogame.image
                    }
                })
            );
        });

        promise.then(function (videogameID) {
            return $.getJSON("php/getVideogame.php", { "id": videogameID });
        }).catch(function (error) {
            console.log("Ha ocurrido un error: " + error);
        }).then(function (response) {
            let videogameObject = response.videogame;

            return new Videogame(
                videogameObject.id, videogameObject.name,
                videogameObject.genre, videogameObject.developer,
                videogameObject.publisher, videogameObject.platform,
                videogameObject.rating, videogameObject.image,
                videogameObject.score, videogameObject.sinceDate
            );
        }).then(function (newVideogame) {
            if (library.isEmpty()) {
                output.empty();
            }

            library.add(newVideogame);
            drawVideogameCard(newVideogame, "flipInY");
            newVideogameModal.modal('hide');
            newVideogameForm[0].reset();
            imagePreview.attr('src', 'img/videogames/no-image-min.png');
            $([document.documentElement, document.body]).animate({
                scrollTop: $('#' + newVideogame.id).offset().top - 150
            }, 500);
        });
    }

    function getAllVideogames() {
        getVideogames().catch(function (error) {
            console.log("Ha ocurrido un error: " + error);
        }).then(function (response) {
            let listJSON = response.list;
            let videogameJSON, videogame, score;
            $.each(listJSON, function (i) {
                videogameJSON = listJSON[i];

                videogame = new Videogame(
                    videogameJSON.id, videogameJSON.name,
                    videogameJSON.genre, videogameJSON.developer,
                    videogameJSON.publisher, videogameJSON.platform,
                    videogameJSON.rating, videogameJSON.image,
                    videogameJSON.score, videogameJSON.sinceDate
                );
                score = videogame.score;

                if (!($.isEmptyObject(score))) {
                    videogame.addScore(
                        score.gameplay_score, score.graphics_score,
                        score.art_score, score.sound_score,
                        score.narrative_score, score.multiplayer_score
                    );
                }

                library.add(videogame);
            });
        }).then(function () {
            if (!sort) {
                library.sortByName();
                sort = true;
            }

            library.isEmpty() ? showEmptyLibraryMessage() : drawVideogamesLibrary(library, "bounceInUp");
        });

        function getVideogames() {
            return $.getJSON("php/getAllVideogames.php");
        }
    }

    function addVideogameScore(videogameID, score) {
        let promise = new Promise(function (resolve) {
            resolve(
                $.ajax({
                    type: "GET",
                    url: "php/addScore.php",
                    data: {
                        "videogame_id": videogameID,
                        "gameplay_score": score.gameplay,
                        "graphics_score": score.graphics,
                        "art_score": score.art,
                        "sound_score": score.sound,
                        "narrative_score": score.narrative,
                        "multiplayer_score": score.multiplayer
                    }
                })
            );
        });

        promise.then(function () {
            return $.getJSON("php/getVideogame.php", { "id": videogameID });
        }).catch(function (error) {
            console.log("Ha ocurrido un error: " + error);
        }).then(function (response) {
            let newScore = response.videogame.score;
            let videogame = library.getByID(videogameID);

            videogame.addScore(
                newScore.gameplay_score, newScore.graphics_score,
                newScore.art_score, newScore.sound_score,
                newScore.narrative_score, newScore.multiplayer_score
            );

            scoreAccordion.collapse('hide');
            newScoreForm[0].reset();
            scoreContainerModel.addClass('no-display');
            outputScore.empty();
            fillScoreData(videogame);
        });
    }

    // Función para eliminar un videojuego
    function removeVideogame(videogameID) {
        $.ajax({
            type: "GET",
            url: "php/removeVideogame.php",
            data: {
                "id": videogameID
            },
            success: function () {

                $('#' + videogameID).addClass('animated bounceOut').one(animationEnd, function () {
                    $(this).remove();
                    library.remove(videogameID);

                    if (library.isEmpty()) {
                        showEmptyLibraryMessage();
                    }
                });

            }
        });
    }

    // Función para eliminar todos los videojuegos
    function removeAllVideogames() {
        $.ajax({
            type: "GET",
            url: "php/removeAllVideogames.php",
            success: function () {
                $('.videogame-box').not('#videogame-card').addClass('animated zoomOutDown').one(animationEnd, function () {
                    $(this).remove();
                    library.removeAll();
                    showEmptyLibraryMessage();
                });
            }
        });
    }
});