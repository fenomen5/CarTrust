const main = {

    init: function () {
        cart.init();
    }
    
}
const menu = {
    select: function (item) {
        $('#' + item).addClass('selected');
    }
}
const cart = {
    init: function () {
        $('.cart-brief-panel').click(function () {
            window.location.href = 'cart.aspx';
        });
    }
}

$(document).ready(function () {
    main.init();
})