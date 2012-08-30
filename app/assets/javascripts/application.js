// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require_tree .
/*
* ADICAO DE JS GENERICA PARA PAIS, ESTADO, CIDADE
* */
jQuery(function($) {
  // when the #country field changes
  $("#country").change(function() {
    // make a POST call and replace the content
    var country = $('select#country :selected').val();
    var nome_view = $('input#nome_view').val();
    if(country == "") country="0";
    jQuery.get('/countries/update_state_select/' + country,{nome_view: nome_view}, function(data){
        $("#addressStates").html(data);
    })
    return false;
  });
})

/*
* FIM
*/

 jQuery(function($) {
  // when the #country field changes
  $("#person_country_id").click(function() {
    // make a POST call and replace the content
    var country = $('select#person_country_id :selected').val();
    if(country == "") country="0";
    jQuery.get('/people/update_state_select/' + country, function(data){
        $("#addressStates").html(data);
    })
    return false;
  });
})





// Disciplinas da Turma/MatrizCurricular
jQuery(function($) {
  // when the #turma field changes
  $("#discipline_class_school_class_id").change(function() {
    // make a POST call and replace the content
    var turma = $('select#discipline_class_school_class_id :selected').val();
    if(turma == "") turma="0";
    jQuery.get('/discipline_classes/update_discipline_select/' + turma, function(data){
        $("#turmaDisciplinas").html(data);
    })
    return false;
  });
})
