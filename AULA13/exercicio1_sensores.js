// Exercício 1: Registro de Sensores Industriais

// Contexto: Uma célula de manufatura automatizada precisa registrar os parâmetros de 3 sensores de temperatura e
// pressão instalados em um reator.

// Requisitos:
// Criar arquivo exercicio1_sensores.js.

// Definir array com 3 objetos contendo: codigo (inteiro), tipo ("Temperatura" / "Pressão"), leituraAtual
// (decimal) e status ("Operando" / "Alerta").

// Converter com indentação de 2 espaços e gravar fisicamente em sensores.json.

// Exibir mensagem de sucesso no terminal ao finalizar.

// 1
const fs = require('fs');
console.log("----- SISTEMA DE AUTOMATIZACAO DE MANUFATURA -----");

const manufaturaAutomatizada = [
{ codigo: 6769, tipo: "Temperatura", leituraAtual: 10.3, status: "Operando" },
{ codigo: 2222, tipo: "Pressão", leituraAtual: 13.3, status: "Operando" },
{ codigo: 1313, tipo: "Temperatura", leituraAtual: 22.2, status: "Alerta" }
];

// 2
const dadosParaGravar = JSON.stringify(manufaturaAutomatizada, null, 2);

// 3
const nomeDoArquivo = "sensores.json";
fs.writeFileSync(nomeDoArquivo, dadosParaGravar);
console.log(`\nGravação concluída com sucesso.`);
console.log(`\nVerifique o arquivo '${nomeDoArquivo}' gerado na barra lateral do VS Code.`);