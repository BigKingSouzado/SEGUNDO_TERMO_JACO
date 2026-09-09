// PEDIDO DE MATÉRIA-PRIMA

const entrada = require(`readline-sync`)

// Variavel para o nome da matéria-prima
const nome_da_materia_prima = entrada.question("Qual o nome da Materia prima que voce deseja comprar?:")

// Variavel para a quantidade de matéria-prima
const quantidade_de_materia_prima = entrada.questionInt("Qual a quantidade dessa Materia prima que voce deseja comprar?:")

// Variavel para o valor da matéria-prima
const valor_unitario = entrada.questionFloat("Qual o valor unitario da Materia prima que voce deseja comprar?: ")

// Variavel do valor final da conta
const valor_final = valor_unitario * quantidade_de_materia_prima


console.log(`\nA Materia-Prima: ${nome_da_materia_prima}\n De Quantidade: ${quantidade_de_materia_prima}\n De valor Unitario: ${valor_unitario}\n Custara: ${valor_final}R$ `)