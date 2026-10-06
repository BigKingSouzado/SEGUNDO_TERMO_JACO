// Exercício 2: Cadastro de Ferramental com Entrada Dinâmica

// Contexto: A ferramentaria precisa registrar ferramentas manuais interativamente pelo terminal e consolidar o lote no
// disco.

// Requisitos:
// Criar arquivo exercicio2_ferramentas.js e utilizar a biblioteca readline-sync.

// Perguntar quantas ferramentas serão registradas e iterar via laço for.

// Para cada ferramenta, solicitar: nome (string), quantidade (inteiro) e custoUnitario (float), inserindo no array
// via .push().

// Persistir os dados em ferramentas.json e exibir confirmação com contagem de itens.

// 1
const fs = require('fs');
const entrada = require('readline-sync');

console.log("----- SISTEMA DE REGISTRO DE FERRAMENTA -----");

const Ferramentas = [];
const totalFerramentas = entrada.questionInt("Quantas ferramentas deseja cadastrar? ");


for (let i = 0; i < totalFerramentas; i++) {
console.log(`\nFerramentas ${i + 1} de ${totalFerramentas}:`);

const nome = entrada.question("Digite o nome da ferramenta: ");

const quantidade = entrada.questionInt("Digite a quantidade: ");

const custoUnitario = entrada.questionFloat("Digite o Custo unitario: R$");

Ferramentas.push({
nome: nome,
quantidade: quantidade,
custoUnitario: custoUnitario
});
}

//2
fs.writeFileSync('ferramentas.json', JSON.stringify(Ferramentas, null, 2));

//3
const nomeDoArquivo = "ferramentas.json";
fs.writeFileSync(nomeDoArquivo);
console.log(`\nGravação concluída com sucesso.`);
console.log(`Ferramnetas gravadas ${listaFerramentas.length}`);
console.log(`\nVerifique o arquivo '${nomeDoArquivo}' gerado na barra lateral do VS Code.`);
