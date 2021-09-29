class Localizacion {
    constructor(callback) {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition((position) => {
                this.latitude = position.coords.latitude;
                this.longitude = position.coords.longitude;

                callback();
            });
        } else {
            alert("Tu navegador no soporta geolocalizacion!! :(")
        }
    }
}
//Maps
function initMap() {
    const ubicacion = new Localizacion(() => {

        const myLatLng = { lat: ubicacion.latitude, lng: ubicacion.longitude };

        var texto = '<h1> Nombre de la calle </h1>' + '<p> Descripcion</p>';

        const options = {
            center: myLatLng,
            zoom: 14

        }
        var map = document.getElementById('map');

        const mapa = new google.maps.Map(map, options);

        const marcador = new google.maps.Marker({
            position: myLatLng,
            map: mapa,
            title: "Mi primer marcador"
        });

        var informacion = new google.maps.InfoWindow({
            content: texto
        });

        marcador.addListener('click', function () {
            informacion.open(mapa, marcador);
        });
    })
}