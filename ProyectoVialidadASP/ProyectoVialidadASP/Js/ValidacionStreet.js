const NLugar = document.getElementById("NLugar");
const NCalle = document.getElementById("NCalle");
const Descripcion = document.getElementById("Descripcion");
const Latitud1 = document.getElementById("Latitud1");
const Latitud2 = document.getElementById("Latitud2");
const Longitud1 = document.getElementById("Longitud1");
const Longitud2 = document.getElementById("Longitud2");
const FProgramacion = document.getElementById("FProgramacion");

//ms error
const errorNLugar = document.getElementById("errorNLugar");
const errorNCalle = document.getElementById("errorNCalle");
const errorDescripcion = document.getElementById("errorDescripcion");
const errorLatitud1 = document.getElementById("errorLatitud1");
const errorLatitud2 = document.getElementById("errorLatitud2");
const errorLongitud1 = document.getElementById("errorLongitud1");
const errorLongitud2 = document.getElementById("errorLongitud2");
const errorFProgramacion = document.getElementById("errorFProgramacion");

const LN = /^[a-zA-Z0-9_.-]*$;
const N = /^-?\d*\.{0,1}\d+$/;

const date = new Date();
$('#FProgramacion').attr('min', date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());

$('#TiempoI').attr('min', date.getHours() + ":" + date.getMinutes());
errorNLugar.textContent = date.getHours() + ":" + date.getMinutes();

formulario.addEventListener('submit', (e) => {
    e.preventDefault();

    if (!LN.test(NLugar.value)) {
        errorNLugar.textContent = "Solo Letras y numeros";
    }
    if (!LN.test(NCalle.value)) {
        errorNCalle.textContent = "Solo Letras y numeros";
    }
    if (!LN.test(Descripcion.value)) {
        errorDescripcion.textContent = "Solo Letras y numeros";
    }

    if (!N.test(Latitud1.value)) {
        errorLatitud1.textContent = "Solo numeros de 3 a 15";
    }
    if (!N.test(Latitud2.value)) {
        errorLatitud2.textContent = "Solo numeros de 3 a 15";
    }
    if (!N.test(Longitud1.value)) {
        errorLongitud1.textContent = "Solo numeros de 3 a 15";
    }
    if (!N.test(Longitud2.value)) {
        errorLongitud2.textContent = "Solo numeros de 3 a 15";
    }

});