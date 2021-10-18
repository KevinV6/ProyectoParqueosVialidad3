const name = document.getElementById("name");
const latitude = document.getElementById("latitude");
const nameStreet = document.getElementById("nameStreet");
const lenght = document.getElementById("lenght");
const parkingSpaces = document.getElementById("parkingSpaces");
const price = document.getElementById("price");
const description = document.getElementById("description");

//ms error
const errorname = document.getElementById("errorname");
const errorlatitude = document.getElementById("errorlatitude");
const errornameStreet = document.getElementById("errornameStreet");
const errorlenght = document.getElementById("errorlenght");
const errorparkingSpaces = document.getElementById("errorparkingSpaces");
const errorprice = document.getElementById("errorprice");
const errordescription = document.getElementById("errordescription");

const LN = /^[a-zA-Z0-9_.-]*$;
const N = /^-?\d*\.{0,1}\d+$/;
const ND = /^[0-9]+([,][0-9]+)?$/;

formulario.addEventListener('submit', (e) => {
    e.preventDefault();

    if (!LN.test(name.value)) {
        errorname.textContent = "Solo Letras y numeros";
    }
    if (!N.test(latitude.value)) {
        errorlatitude.textContent = "Solo numeros de 3 a 15";
    }
    if (!LN.test(nameStreet.value)) {
        errornameStreet.textContent = "Solo Letras y numeros";
    }
    if (!N.test(lenght.value)) {
        errorlenght.textContent = "Solo numeros de 3 a 15";
    }
    if (!N.test(parkingSpaces.value)) {
        errorparkingSpaces.textContent = "Solo numeros de 3 a 15";
    }
    if (!ND.test(price.value)) {
        errorprice.textContent = "Solo numeros o decimales";
    }
    if (!LN.test(description.value)) {
        errordescription.textContent = "Solo Letras y numeros";
    }

});