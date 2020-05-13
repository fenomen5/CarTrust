const gmap = {

    init: function (containerId) {

        
        var address = { lat: -36.867600, lng: 174.741615 };
        // The map, centered at Uluru
        var map = new google.maps.Map(
            document.getElementById(containerId), { zoom: 15, center: address });

        // The marker, positioned at Uluru
        var marker = new google.maps.Marker({ position: address, map: map });
    }

}
//const menu = {
//    select: function (item) {
//        $('#' + item).addClass('selected');
//    }
//}
//const cart = {
//    init: function () {
//        $('.cart-brief-panel').click(function () {
//            window.location.href = 'cart.aspx';
//        });
//    }
//}

$(document).ready(function () {
    gmap.init();
})