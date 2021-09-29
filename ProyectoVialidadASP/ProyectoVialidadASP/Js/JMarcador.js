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

        var texto = 'Nombre del lugar';

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


    })
}