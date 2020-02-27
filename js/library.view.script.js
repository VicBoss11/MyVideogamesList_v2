// Para realizar operaciones en términos visuales utilizo JQuery ya que simplifica el código de JavaScript
// Solo se ejecuta cuando el documento (HTML) está preparado

$(document).ready(function () {
    // ####################################################################################################################
    // Cambiar el icono al pulsar un botón dependiendo del último estado de éste
    $('#score-videogame-accordion').on('show.bs.collapse', function () {
        $('.icon-expand').removeClass('fa-caret-square-down');
        $('.icon-expand').addClass('fa-caret-square-up');
    });

    $('#score-videogame-accordion').on('hide.bs.collapse', function () {
        $('.icon-expand').removeClass('fa-caret-square-up');
        $('.icon-expand').addClass('fa-caret-square-down');
    });

    // ####################################################################################################################
    $("#videogame-image-chooser").change(function () {
        readURL(this);
    });

    // Función para actualizar previsualización de imagen de forma dinámica
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#videogame-image-preview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    // ####################################################################################################################
    // Activar tooltip de Bootstrap
    $('[data-tooltip="tooltip"]').tooltip();
    // Mostrar tooltipe únicamente en el estado "hover", ocultar aunque el estado sea "focus"
    $('[data-tooltip="tooltip"]').on('focus', function () {
        $(this).tooltip('hide');
    });

    // Habilitar/Deshabilitar campos del formulario de valoración
    $('#single-videogame-option').on('click', function () {
        $('#narrative-score-field').removeAttr('disabled');
        $('#multiplayer-score-field').attr('disabled', "");
    });

    $('#multi-videogame-option').on('click', function () {
        $('#narrative-score-field').attr('disabled', "");
        $('#multiplayer-score-field').removeAttr('disabled');
    });

    $('#bothType-videogame-option').on('click', function () {
        $('#narrative-score-field').removeAttr('disabled');
        $('#multiplayer-score-field').removeAttr('disabled');
    });
});