function calcularMaoDeobra(horas){
    const valorHora = 80.00
    return horas * valorHora
}

function calcularTotal(valorPecas, horas){
    return valorPecas + calcularMaoDeObra(horas)
}

function verificarGarantia(meses){
    if (meses <=6){
        return "EM GARANTIA"
    }else{
        return "SEM GRANTIA"
    }
}
module.exports= {
    calcularMaoDeObra,
    calcularTotal,
    verificarGarantia
}