var vueinst = new Vue({
    el: '#result',
    data: {
        show: false,
    }
});

const submit = function() {
    document.getElementById('Submit').addEventListener('click', search);
};

let search = function(event) {
    event.preventDefault();
    var search = {
        Genre: document.getElementById('Genre').value,
        Platform: document.getElementById('Platform').value,
        Feature: document.getElementById('Features').value,
        Price: document.getElementById('Price').value
    };

    if (search.Genre == "" || search.Platform == "" || search.Feature == "" || search.Price == "") {
        alert("Missing field");
        return 0;
    }


    console.log(search);



    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var response = JSON.parse(this.responseText);
            console.log(response);
            document.getElementById('tablebody').innerHTML = "";
            for (var i = 0; i < response.length; i++) {
                var row = document.createElement('tr');
                var name = document.createElement('td');
                var genre = document.createElement('td');
                var platform = document.createElement('td');
                var feature = document.createElement('td');
                var price = document.createElement('td');
                name.innerHTML = response[i].Name;
                genre.innerHTML = response[i].Genre;
                platform.innerHTML = response[i].Platform;
                feature.innerHTML = response[i].Feature;
                price.innerHTML = response[i].Price;
                row.appendChild(name);
                row.appendChild(genre);
                row.appendChild(platform);
                row.appendChild(feature);
                row.appendChild(price);
                document.getElementById('tablebody').appendChild(row);
            }

        }
    };

    xhttp.open("POST","/search", true);

    xhttp.setRequestHeader("Content-type","application/json");

    xhttp.send(JSON.stringify(search));


};

document.addEventListener('DOMContentLoaded',submit);