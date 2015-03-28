(function() {
    var fortune;

    function currentFortune() {
        return fortune.textContent;
    }

    function requestFortune() {
        $.when($.ajax('fortune.php', { dataType: 'text' })).then(function(data) {
            fortune.textContent = data;
        });
    }

    function shareFortune() {
        Omlet.exit({ type: 'text', data: { text: currentFortune() } });
    }

    Omlet.ready(function() {
        fortune = $('#fortune');

        $('#share-button').click(function() {
            shareFortune();
        });
        $('#refresh-button').click(function() {
            requestFortune();
        });

        requestFortune();
    })
})()
