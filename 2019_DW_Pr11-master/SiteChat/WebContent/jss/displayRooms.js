var counter = 10;

    // The countdown method.
    /*window.setInterval(function () {
        counter--;
        if (counter >= 0) {
            var span;
            span = document.getElementById("cnt");
            span.innerHTML = counter;
        }
        if (counter === 0) {
            clearInterval(counter);
        }

    }, 1000);*/

window.setInterval(function () {
    counter--;
    if (counter >= 0) {
        var span;
        span = document.getElementById("cnt");
    }
    if (counter === 0) {
        clearInterval(counter);
    }

}, 1000);

    window.setInterval('refresh()', 10000);

    // Refresh or reload page.
    function refresh() {
        window  .location.reload();
    }