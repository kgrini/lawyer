// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( ".comment-respond" ).hide();
$( ".comment-link" ).text("развернуть");
$( ".comment-link" ).on('click', function(){
    if ($(this).text() == 'развернуть') {
        $(this).prev().show();
        $(this).text('свернуть');
    } else{
        $(this).prev().hide();
        $(this).text('развернуть');
    }
});

function validateField(object){
    if (object.val() == 0){
        object.focus();
        return false;
    } else {
        return true;
    }
}

function nameIsValid(){
    validateField($("#imea"));
}

function phoneIsValid(){
    validateField($("#telefon"));
}

function regionIsValid(){
    validateField($("#region"));
}

function emailIsValid(){
    validateField($("#email"));
}

function questionIsValid(){
    validateField($("#vopros"));
}

function formIsValid(){
    return  questionIsValid() ||  regionIsValid() || emailIsValid() || phoneIsValid()|| nameIsValid()
}

function buildJson(){

}

$('.button').on('click', function(){
    if (formIsValid()){
        data = buildJson();
        $.post('', data, function(response) {
        }, 'json');
    }
});
