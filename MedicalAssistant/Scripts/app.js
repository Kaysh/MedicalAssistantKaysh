$(function () {

    var apiKey = "AIzaSyAg1OxEX_KREPBl0l9LhxtT867amfl3gFE";
    var query = "Gateway,Durban,South+Africa";

    $("#googleMapiFrame").attr("src", "https://www.google.com/maps/embed/v1/place?key=" + apiKey + "&q=" + query);
});