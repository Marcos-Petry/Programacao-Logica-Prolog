:- set_prolog_flag(encoding, utf8).

% Base de conhecimento com teorias do crime
teoria_roubo :- impressao_digital, motivo(ganancia), testemunha_ocular.
teoria_assassinato :- motivo(rancor), testemunha_ocular, arma_fogo.
teoria_furto :- motivo(necessidade), testemunha_ocular, objeto_roubado.
teoria_vandalismo :- motivo(ira), testemunha_ocular, dano_material.

% Limpa as evidências antes de iniciar a investigação
limpar_evidencias :- 
    retractall(impressao_digital),
    retractall(motivo(_)),
    retractall(testemunha_ocular),
    retractall(arma_fogo),
    retractall(objeto_roubado),
    retractall(dano_material).

% Inicia a investigação
investigacao :- 
    limpar_evidencias,
    write('Sistema de Investigação Criminal. Responda às perguntas com "s" para sim ou "n" para não.\n'),
    pergunta(impressao_digital, 'Foi encontrada impressão digital no local? (s/n): '),
    pergunta(motivo(Ganho), 'O motivo parece ser: ganância? (s/n): '),
    pergunta(motivo(Rancor), 'O motivo parece ser: rancor? (s/n): '),
    pergunta(motivo(necessidade), 'O motivo parece ser: necessidade? (s/n): '),
    pergunta(testemunha_ocular, 'Há testemunha ocular do crime? (s/n): '),
    pergunta(arma_fogo, 'Foi utilizada arma de fogo no crime? (s/n): '),
    pergunta(objeto_roubado, 'Algum objeto foi roubado? (s/n): '),
    pergunta(dano_material, 'Houve dano material no local? (s/n): '),
    teoria_resultado.

% Função para perguntar e registrar evidência com validação de entrada
pergunta(Evidencia, Pergunta) :- 
    write(Pergunta),
    nl,
    read_line_to_string(user_input, Resposta),
    validar_resposta(Resposta, Evidencia).

% Valida as respostas do usuário
validar_resposta(Resposta, Evidencia) :- 
    (Resposta == "s" -> assert(Evidencia), !;
     Resposta == "n" -> true, !;
     write('Resposta inválida. Por favor, responda apenas com "s" ou "n".\n'), 
     pergunta(Evidencia, Pergunta)).

% Exibe a teoria sobre o crime com base nas evidências
teoria_resultado :- 
    (teoria_roubo -> 
        write('Teoria: Possível roubo, motivado por ganância. A impressão digital no local e a testemunha ocular podem ser cruciais para a investigação. Verifique se há mais evidências físicas.\n');
     teoria_assassinato -> 
        write('Teoria: Possível assassinato, motivado por rancor. A presença de testemunha ocular e a utilização de arma de fogo indicam um crime premeditado. Investigar os motivos e verificar os álibis pode ser crucial.\n');
     teoria_furto -> 
        write('Teoria: Possível furto, motivado por necessidade. O roubo de objetos e a presença de testemunhas podem sugerir um crime oportunista. Investigue o histórico dos suspeitos e o valor dos objetos roubados.\n');
     teoria_vandalismo -> 
        write('Teoria: Possível vandalismo, motivado por ira. Dano material no local e a testemunha ocular indicam um ataque impulsivo. Verifique se há histórico de conflito entre as partes envolvidas.\n');
     (motivo(Ganancia); motivo(Rancor); motivo(necessidade); motivo(Ira)) ->
        write('O motivo está claro, mas as evidências restantes precisam ser mais analisadas. A investigação deve se concentrar em testemunhas oculares e objetos encontrados no local.\n');
     write('As evidências coletadas não apontam claramente para uma teoria específica. A investigação deve ser aprofundada, considerando outros fatores como antecedentes dos envolvidos e eventuais câmeras de segurança.\n')).

