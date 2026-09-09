// PEÇA APROVADA OU REPROVADA

// EXTEÇÃO PARA ARMAZENAR VARIAVEL
const entrada = require(`readline-sync`)

// Variavel para o peso da peça
const peso_da_peca = entrada.questionInt("Qual o pesso da peca?:")

if (peso_da_peca  >= 95 && peso_da_peca <= 105 ) {
    console.log("PECA APROVADA")
} else {
    console.log("PECA REPROVADA")
}
