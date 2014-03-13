// Place all the behaviors and hooks related to the matching controller here.

$(document).ready(function() {

    $('#notes .note:even').css("backgroundColor", "#E9E9E9");
    $('#add_note textarea').keyup(function() {
        if ($(this).val() == '') {
            $('#add_note input[type="submit"]').attr('disabled', 'disabled');
        }
        else {
            $('#add_note input[type="submit"]').removeAttr('disabled');
        }
    });

});