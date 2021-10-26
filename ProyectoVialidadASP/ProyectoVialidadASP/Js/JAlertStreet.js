function CheckConfirmDelet() {

    if (confirm('Estas seguro de que quieres eliminar?'))
        __doPostBack('BtnDeleteSelected', '');
    else
        return false;

    return true;

}
function CheckConfirmActive() {

    if (confirm('Estas seguro de que quieres activar?'))
        __doPostBack('BtnDeleteSelected', '');
    else
        return false;

    return true;

}