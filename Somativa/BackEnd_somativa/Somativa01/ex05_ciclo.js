// TABELA DE PRODUÇÃO

const entrada = require('readline-sync');

const sequencia = entrada.questionInt("Quantas pecas a maquina produz por ciclo?:");

for (let i = 1; i <= 10; i++) {
    console.log(`${i * sequencia}`)
}
