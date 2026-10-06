const entrada = require('readline-sync')
const funcoes = require('./funcoesManutencao');

const maquina = entrada.question("Digite o nome da maquina: ");
const valorPecas = entrada.questionFloat("Digite o valor das pecas R$: ")
const horas = entrada.questionInt("Quantas horas trabalhadas? ");
const meses = entrada.questionInt("Quantos meses desde a ultima manutenção: ")

const maoObra = funcoes.calcularMaoDeObra(horas);
const total = funcoes.calculartotal(valorPecas, horas);