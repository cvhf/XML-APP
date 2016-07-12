function checkRating(){
    var birthdiv = document.getElementsByName( 'birth' );
    var birthdate = birthdiv[0].getAttribute( 'id' );
    var deathdiv = document.getElementsByName( 'death' );
    var deathdate = deathdiv[0].getAttribute( 'id' );


    var avgyears = Math.round(((parseInt(deathdate) + parseInt(birthdate))/2));

    console.log("i was clicked");
    if(document.getElementById('rating1').checked) {
        console.log("checked Ugly");
        var rating = 0;
        //Male radio button is checked
    }else if(document.getElementById('rating2').checked) {
        console.log("checked OK");
        var rating = 1;
        //Female radio button is checked
    }
    else if(document.getElementById('rating3').checked) {
        console.log("checked nice");
        var rating = 2;
        console.log(typeof(rating));
        //Female radio button is checked
    }

    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
    if (getParameterByName('page')== null){
        var page = 2;
        console.log("rating is null");
    }
    else {
        var page = parseInt(getParameterByName('page')) + 1;
    }
    console.log(getParameterByName('rating'));

    if (getParameterByName('rating')== null){
        var ratingtotal = rating * avgyears;
        console.log("rating is null");
    }
    else {

        ratingtotal = parseInt(getParameterByName('rating'))+(rating * avgyears);

    }

    if (getParameterByName('nrratings')== null){

       var nrratings = rating;
        console.log("rating is null");
    }
    else{
        nrratings = parseInt(getParameterByName('nrratings'))+rating;
    }


    console.log(page + 1 );
    console.log(rating);
    console.log(nrratings);

    var url = window.location.href.split('?')[0];

    if (page < 6) {
        window.location.href = url + '?page=' + page + '&rating=' + ratingtotal + '&nrratings=' + nrratings;
    }
    else{
        var myNode = document.getElementById("main");
        while (myNode.firstChild) {
            myNode.removeChild(myNode.firstChild);
        }
        var resultyear = Math.round(ratingtotal / nrratings);
        var fragment = create('<div><h1 class="center">Bart und Frisuren Ergebnis:</h1><br><h1 class="center">Lieber Bart und Frisuren Fan du wärest am besten im Jahr</h1>' +
            '<br><h1 class="center">'+resultyear+'</h1><br><h1 class="center">aufgehoben gewesen</h1> </div>');
// You can use native DOM methods to insert the fragment:
        document.body.insertBefore(fragment, document.body.childNodes[0]);
    }



    function create(htmlStr) {
        var frag = document.createDocumentFragment(),
            temp = document.createElement('div');
        temp.innerHTML = htmlStr;
        while (temp.firstChild) {
            frag.appendChild(temp.firstChild);
        }
        return frag;
    }




}