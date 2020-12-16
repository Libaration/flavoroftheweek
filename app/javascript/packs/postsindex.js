$( ".songcontainer" ).hover(
    function() {
        $( this ).prevUntil('.posted_by img').fadeIn("fast");
    }, function() {
        $( this ).prevUntil('.posted_by img').fadeOut("fast");
    }
);