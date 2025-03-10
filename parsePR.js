const fs = require('fs');
const readline = require('readline');

async function extractTests() {
  const testsFilePath = __dirname + '/testsToRun.txt';
  let testFound = false;

  // Cria o stream de leitura para o arquivo pr_body.txt
  const fileStream = fs.createReadStream(__dirname + '/pr_body.txt');

  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  });

  // Procura por linhas que contenham o delimitador Apex::[...]::Apex
  for await (const line of rl) {
    if (line.includes('Apex::[') && line.includes(']::Apex')) {
      // Encontra a posição dos colchetes
      const startBracket = line.indexOf('[');
      const endBracket = line.indexOf(']', startBracket);
      if (startBracket !== -1 && endBracket !== -1 && endBracket > startBracket) {
        const tests = line.substring(startBracket + 1, endBracket).trim();
        if (tests) {
          // Sobrescreve o arquivo com o nome dos testes encontrados
          await fs.promises.writeFile(testsFilePath, tests + "\n");
          testFound = true;
          break; // Se desejar considerar apenas a primeira ocorrência, saia do loop
        }
      }
    }
  }

  // Se nenhum teste foi especificado, define "all" como padrão
  if (!testFound) {
    await fs.promises.writeFile(testsFilePath, 'all\n');
  }
}

extractTests();
