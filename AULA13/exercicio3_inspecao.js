// Exercício 3: Histórico de Inspeção de Qualidade com Validação de Lote
// Contexto: Um inspetor de qualidade afere a espessura de 4 chapas de aço. O sistema compila as medições e valida a
// tolerância técnica do lote.

// Requisitos:
// Criar arquivo exercicio3_inspecao.js.

// Estruturar o objeto relatorioInspecao com: data ("2026-09-23"), inspetor (nome), amostras (array de 4
// números em mm) e loteAprovado (booleano).

// O lote só é aprovado se todas as medidas forem ≥ 12.0 mm.

// Converter para JSON e salvar no arquivo inspecao_qualidade.json, emitindo veredito no console.

const fs = require('fs');

console.log("----- SISTEMA DE INSPECAO DE QUALIDADE DE LOTE -----");

const coletaDeLote = [10.1, 9.3, 13.0, 12.0];

let aprovacao = true;
for (let i = 0; i < coletaDeLote.length; i++) {
    if (coletaDeLote[i] < 12.0) {
        aprovacao = false;}
}

const relatorioDeInspecao = {
    data: "2026-09-29",
    inspetor: "Jaco de Souza",
    amostras: coletaDeLote,
    loteAprovado: aprovacao
};

// 2
fs.writeFileSync('inspecao_qualidade.json', JSON.stringify(relatorioDeInspecao, null, 2));

// 3

console.log(`\nGravação concluída com sucesso.`);
console.log(`Status da Inspecao do Lote ${aprovacao ? "APROVADO" : "REPROVADO"}`);
