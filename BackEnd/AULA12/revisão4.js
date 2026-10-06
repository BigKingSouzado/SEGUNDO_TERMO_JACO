const entrada = require(`readline-sync`);

const materiais = [];

for (let i = 0; i <=3; i++){
    const material = {
        nome: entrada.question(`Digite o nome do produto ${i+1}: `),
        quantidade: entrada.questionInt(`Digite a Quantidade do produto ${i+1}: `),
        estoqueMinimo: entrada.questionInt(`Digite a Quantidade Minima do produto ${i+1}: `)
    };
    materiais.push(material);
}

console.log("--- RELATORIO DE ESTOQUE ---");

for (let i = 0; i < materiais.length; i++){
    const produto = materiais[i];

    let situacao;
    if (produto.quantidade < produto.estoqueMinimo){
        situacao = "REPOR ESTOQUE";
    }else {
        situacao = "ESTOQUE OK";
    }
    console.log(`Material: ${produto.nome}`);
    console.log(`Quantidade: ${produto.quantidade}`);
    console.log(`Estoque Minimo: ${produto.estoqueMinimo}`);
    console.log(`Situacao: ${situacao}`);
    console.log("-".repeat(20) );
}

