



//esta funcion nos recupera el background color en la db
const recuperarStyle = () => {

    const url = "/Reportes/RecuperarStyle"
    fetch(url)
        .then(res => res.json())
        .then(data => {


            let area_averias = document.getElementById("area_averias");
            area_averias.style.backgroundColor = `${data.background}`;

            let head_table = document.getElementById("head_table");
            head_table.style.backgroundColor = `${data.background}`;


            let inputColor = document.getElementById("inputcolor");
            inputColor.value = `${data.background}`;
        })


}

recuperarStyle();
