# Programação Lógica

- Objetivo: Fixar os conhecimentos práticos referentes à programação lógica, atravé da linguagem de programação Prolog.

- O projeto será dividido em cinco módulos, cada um focando em uma aplicação específica de um sistema especialista. O objetivo é desenvolver diferentes sistemas que deduzem informações ou fazem recomendações baseadas em fatos e regras estabelecidos.

## Casos

### Diagnóstico Médico

- Objetivo: Criar um sistema especialista que sugira diagnósticos médicos com base em sintomas informados pelo usuário.

- Requisitos:
    - Definir uma base de sintomas comuns, como febre, dor de cabeça, tosse, etc.
    - Implementar regras de inferência para diagnósticos de doenças simples, como gripe, infecção viral ou enxaqueca.
    - Permitir a interação com o usuário, fazendo perguntas sobre os sintomas e deduzindo o diagnóstico mais provável.
    - Incluir um alerta ou recomendação para consultar um médico se o sistema não puder identificar uma condição específica.

### Análise de Problemas de Veículos

- Objetivo: Desenvolver um sistema especialista que ajude a identificar problemas comuns em veículos com base em sintomas ou comportamentos relatados.

- Requisitos:
    - Definir uma base de problemas comuns, como motor não liga, barulho estranho ao frear, ou vazamento de óleo.
    - Implementar regras para sugerir soluções, como verificar a bateria, o sistema de freios ou o nível de óleo.
    - Permitir ao usuário descrever o problema do veículo e obter recomendações de diagnóstico ou manutenção.
    - Oferecer conselhos de segurança, como "leve o carro a um mecânico" se o problema for grave.

### Recomendações de Livros

- Objetivo: Criar um sistema especialista que recomende livros com base em preferências de gênero e interesses do usuário.

- Requisitos:
    - Criar uma base de dados de livros, categorizados por gênero, como ficção, ciência, história, ou autoajuda.
    - Implementar regras que façam recomendações com base nas respostas do usuário sobre seus interesses.
    - Permitir ao usuário selecionar múltiplos gêneros ou tópicos de interesse.
    - Oferecer recomendações detalhadas, incluindo o título do livro e uma breve sinopse.

### Recomendação de Treinos de Academia

- Objetivo: Desenvolver um sistema especialista que sugira treinos de academia baseados em objetivos, como perder peso, ganhar massa muscular ou melhorar o condicionamento físico.

- Requisitos:
    - Definir uma lista de treinos e exercícios específicos para diferentes objetivos.
    - Implementar regras que associem os objetivos do usuário com planos de treino recomendados.
    - Perguntar ao usuário sobre seu objetivo, experiência na academia e disponibilidade de tempo.
    - Oferecer recomendações detalhadas de treino, incluindo séries, repetições e instruções para cada exercício.

### Análise de Investigação Criminal

- Objetivo: Criar um sistema especialista que auxilie na análise de casos criminais, sugerindo suspeitos ou cenários com base em evidências e testemunhos.

- Requisitos:
    - Definir uma base de evidências e testemunhos, como impressões digitais, motivo, ou testemunha ocular.
    - Implementar regras que relacionem as evidências com possíveis suspeitos ou teorias do crime.
    - Permitir ao usuário fornecer informações sobre um caso específico e obter uma análise preliminar.
    - Incluir opções para recomendar a investigação de determinados suspeitos ou a verificação de álibis.

## Configuração 

1. Necessário baixar o Prolog na sua máquina.

2. Durante o desenvolvimento desse trabalho as seguintes ferramenta foram utilizadas
    - Visual Studio Code.
    - SWI-Prolog.

3. Recomendo executar o camando `set_prolog_flag(encoding, utf8).` ao inicial a ide do prolog, isso permite a interpretação de caracteres especiais.