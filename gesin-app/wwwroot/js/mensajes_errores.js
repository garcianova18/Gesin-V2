function modalerror(texto, posicion = 'center',textofooter= '') {


    Swal.fire({
        position: posicion,
        icon: 'error',
        text: texto,
        showConfirmButton: true,
        background: '#130a28',
        color: '#ffff',

        //timer: 1000,
        footer: textofooter

    })

}