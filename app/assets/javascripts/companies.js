// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {

    $("a.upload-btn").click(function(event){
        $("input.file").click();
    });

    var preview = $(".upload-preview img");
    $(".upload-preview").hide();

    $("input.file").change(function(event){
       var input = $(event.currentTarget);
       var file = input[0].files[0];
       var reader = new FileReader();
       $(".upload-preview").show();
       reader.onload = function(e){
           image_base64 = e.target.result;
           preview.attr("src", image_base64);
       };
       reader.readAsDataURL(file);
    });
})
