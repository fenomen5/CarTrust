const slider = {

    init: function (containerId) {

        /* SET PARAMETERS */
        var change_img_time = 5000;
        var transition_speed = 300;

        var randfx = '';
        var fxArr = ['slideLeft', 'slideRight', 'fadeIn', 'bigEntrance', 'pullUp', 'pullDown', 'stretchLeft', 'stretchRight'];
        var specialfx = 'rand';

        var simple_slideshow = $(".promo-slider"),
            listItems = simple_slideshow.children('li'),
            listLen = listItems.length,
            i = 0,

            changeList = function () {
                listItems.eq(i).fadeOut(transition_speed, function () {
                    i += 1;
                    if (i === listLen) { i = 0; }

                    randfx = fxArr[3];
                    
                    listItems.eq(i).fadeIn(transition_speed).attr('class', '').addClass(randfx);
                    randfx = '';
                });
            };

        listItems.not(':first').hide();
        setInterval(changeList, change_img_time);

    }
}

$(document).ready(function () {
    slider.init();
})