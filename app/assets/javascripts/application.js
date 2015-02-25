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
//= require modernizr.min.js
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
    return validateField($("#imea"));
}

function phoneIsValid(){
    return validateField($("#telefon"));
}

function regionIsValid(){
    return validateField($("#region"));
}

function emailIsValid(){
    return validateField($("#email"));
}

function questionIsValid(){
    return validateField($("#vopros"));
}

function formIsValid(){
    return  questionIsValid() ||  regionIsValid() || emailIsValid() || phoneIsValid()|| nameIsValid()
}

$('.button').on('click', function(){
    if (formIsValid()){
//        $.getJSON("http://smart-ip.net/geoip-json?callback=?", function(data){
//            console.log(data)
            function returnJson() {
                var formData = {};
                formData = {   form_page: 'http://juristsovet.ru',
                    referer: document.referrer,
                    client_api: '127.0.0.1',
                    userid: 5282,
                    product: 'lawyer',
                    template: 'default',
                    key: null,
                    first_last_name: $('#imea').val(),
                    phone: $('#telefon').val(),
                    email: $('#email').val(),
                    region: $('#region').val(),
                    question: $('#vopros').val(),
                    subaccount: null
                };
                return formData;

            }
           xhr = new XMLHttpRequest();
            $.ajax({
                crossDomain: true,
                type: "POST",
                url: 'http://cloud1.leadia.ru/lead.php',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                data: returnJson(),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Access-Control-Allow-Origin", "*");
                    console.log(xhr)
                },
//                header: {
//                    'Access-Control-Allow-Origin': '*'
//                },
                success: function(){
                    resetForm();
                }
            });
//        })
    }
});

$('.header .button').on('click', function(){
    questionIsValid()
});


function resetForm(){
    $('#imea').val('');
    $('#telefon').val('');
    $('#email').val('');
    $('#region').val('');
    $('#vopros').val('');
}

