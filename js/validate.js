$(document).ready(() => {
    var validate = {
        name: (inputField) => {
            "use strict";

            var nameVal = $(inputField).val(),
                nameRegex = /\w[a-zA-ZÆØÅæøå]+$/;
            
            if(nameVal.length !== 0 && nameRegex.test(nameVal)){
                $(inputField).parent('div')
                                .removeClass("has-error")
                                .addClass("has-success");
                $(inputField).next()
                                .removeClass("glyphicon-remove")
                                .addClass("glyphicon-ok")
                                .next('.errMsg').html('');
                return true;
            }else{
                $(inputField).parent('div')
                                .removeClass("has-success")
                                .addClass("has-error");
                
                $(inputField).next()
                                .removeClass("glyphicon-ok")
                                .addClass("glyphicon-remove")
                                .next('.errMsg').html('Navn skal udfyldes, og må ikke indholde tal');
                return false;
            }
        }, 
        email: (inputField) => {
            "use strict";

            var emailVal =  $(inputField).val(),
                emailRegex = /^[A-Za-zÆØÅæøå0-9_.]+[@]{1}[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;

            if(emailVal.length !== 0 && emailRegex.test(emailVal)){
                $(inputField).closest('.form-group')
                                .removeClass("has-error")
                                .addClass("has-success");
                $(inputField).parent('div')
                                .next('span')
                                .removeClass("glyphicon-remove")
                                .addClass("glyphicon-ok")
                                .next('.errMsg').html('');
                return true;
            }else{
                $(inputField).closest('.form-group')
                                .removeClass("has-success")
                                .addClass("has-error");
                $(inputField).parent('div')
                                .next('span')
                                .removeClass("glyphicon-ok")
                                .addClass("glyphicon-remove")
                                .next('.errMsg').html('E-mail skal være i korrekt format');
                return false;
            }
        },
        subject: (inputField) => {
            "use strict";
            var subjectVal = $(inputField).val(),
                subjectRegex = /\w[a-zA-ZÆØÅæøå0-9]+$/;
            if(subjectVal.length !== 0 && subjectRegex.test(subjectVal)){
                $(inputField).parent('div')
                                .removeClass("has-error")
                                .addClass("has-success");
                $(inputField).next()
                                .removeClass("glyphicon-remove")
                                .addClass("glyphicon-ok")
                                .next('.errMsg').html('');
                return true;
            }else{
                $(inputField).parent('div')
                                .removeClass("has-success")
                                .addClass("has-error");
                
                $(inputField).next()
                                .removeClass("glyphicon-ok")
                                .addClass("glyphicon-remove")
                                .next('.errMsg').html('Emne skal udfyldes og må ikke indholde specialtegn.');
                return false;
            }
        },
        message: (inputField) => {
            "use strict";
            var msgVal = $(inputField).val();

            if(msgVal.length >= 20){
                $(inputField).parent('div')
                                .removeClass("has-error")
                                .addClass("has-success");
                $(inputField).next()
                                .removeClass("glyphicon-remove")
                                .addClass("glyphicon-ok")
                                .next('.errMsg').html('');
                return true;
            }else{
                $(inputField).parent('div')
                                .removeClass("has-success")
                                .addClass("has-error");
                
                $(inputField).next()
                                .removeClass("glyphicon-ok")
                                .addClass("glyphicon-remove")
                                .next('.errMsg').html('Besked skal være mindst 20 tegn');
                return false;
                }
        }
    }



    $("#contactForm").keyup( (objForm) => {
        "use strict";
        if(objForm.target.name === "name"){
            validate.name("#name");
        }else if(objForm.target.name === "email"){
            validate.email("#email");
        }else if(objForm.target.name === "subject"){
            validate.subject("#subject");
        }else if(objForm.target.name === "message"){
            validate.message("#message");
        }
    });

});