const user = document.getElementById("userText");
const pass = document.getElementById("passText");
const errorUser = document.getElementById("error1");
const errorPass = document.getElementById("error2");

const LN = /^[a-zA-Z0-9_.-]*$/;


formulario.addEventListener('submit', (e) => {
    e.preventDefault();
    errorUser.textContent = "";
    errorPass.textContent = "";
    if (user.value.length > 8 && user.value.length > 8) {
        if (user.value.length > 8) {
            errorUser.textContent = "No mas de 8 caracteres";
        }
    } else {
        if (!LN.test(user.value)) {
            errorUser.textContent = "Solo Letras y numeros";
        }
    }
    
});
