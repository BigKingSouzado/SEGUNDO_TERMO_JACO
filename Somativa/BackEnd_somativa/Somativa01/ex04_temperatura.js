// CLASSIFICAÇÃO DE TEMPERATURA

// EXTEÇÃO PARA ARMAZENAR VARIAVEL 
const entrada = require(`readline-sync`)

// Variavel para armazenar a temperatura
const temperatura_atual = entrada.questionFloat("Qual a temperatura que esta agora?: ")

if (temperatura_atual >= 80) {
    console.log("situacao: CRITICA")
} else if (temperatura_atual >= 61 && temperatura_atual <= 80) {
    console.log("situacao: ATENCAO")
} else {
    console.log("situacao: NORMAL")
}

