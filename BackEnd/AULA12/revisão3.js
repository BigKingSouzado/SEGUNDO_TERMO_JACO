const entrada = require('readline-sync');

const operadores = [];

for (let i = 0; i <= 4; i++){
    const nomes = entrada.question(`Digite o nome do Funcionario ${i+1} `);                                   
    operadores.push(nomes);
}
console.log("=== SISTEMA DE CADASTRO DE FUNCIONARIOS ===");

for (let i = 0; i < operadores.length; i++); {
    console.log(`${i+1} - ${operadores[i]}`);
}