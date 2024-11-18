:- set_prolog_flag(encoding, utf8).

% Base de conhecimento com treinos e seus objetivos
treino('Treino Genérico para Hipertrofia', [
    'Supino reto: 4 séries de 8 repetições',
    'Agachamento: 4 séries de 10 repetições',
    'Rosca direta: 3 séries de 12 repetições'
]) :- 
    objetivo(ganhar_massa).

treino('Treino Genérico para Perda de Peso', [
    'Corrida intervalada: 5 séries de 3 minutos (descanso: 1 minuto)',
    'Treinamento funcional: 3 séries de 15 repetições',
    'Burpees: 3 séries até a falha'
]) :- 
    objetivo(emagrecer).

treino('Treino Genérico para Condicionamento', [
    'Corrida contínua: 20 minutos em ritmo leve a moderado',
    'Flexões: 3 séries de 15 repetições',
    'Abdominais: 3 séries até a falha'
]) :- 
    objetivo(condicionamento).

% Regras para criar treinos mais genéricos se nenhum específico for encontrado
treino('Treino Iniciante Completo', [
    'Caminhada rápida: 15 minutos',
    'Agachamento livre: 3 séries de 15 repetições',
    'Flexões adaptadas: 3 séries de 10 repetições',
    'Prancha: 3 séries de 20 segundos'
]) :- 
    experiencia(iniciante).

treino('Treino Funcional para Todos os Objetivos', [
    'Circuito aeróbico: 5 rounds de 2 minutos (correr, pular corda, bike)',
    'Treinamento com peso corporal: 3 séries de 12 repetições',
    'Prancha lateral: 3 séries de 15 segundos'
]) :- 
    preferencia_treino(funcional).

treino('Treino Musculação Base', [
    'Supino reto com barra: 3 séries de 12 repetições',
    'Rosca direta com halteres: 3 séries de 12 repetições',
    'Agachamento com barra: 3 séries de 12 repetições'
]) :- 
    preferencia_treino(musculacao).

% Limpar as preferências antes de iniciar uma nova recomendação
limpar_preferencias :- 
    retractall(objetivo(_)),
    retractall(experiencia(_)),
    retractall(disponibilidade(_)),
    retractall(preferencia_treino(_)).

% Recomendação
recomendacao :- 
    limpar_preferencias,
    write('Sistema de Recomendação de Treinos de Academia.\n'),
    perguntar_objetivo,
    perguntar_experiencia,
    perguntar_disponibilidade,
    perguntar_preferencia_treino,
    gerar_recomendacoes.

% Perguntar sobre o objetivo
perguntar_objetivo :- 
    write('Qual é o seu objetivo na academia?\n'),
    write('1. Ganhar massa muscular\n'),
    write('2. Emagrecer\n'),
    write('3. Melhorar o condicionamento físico\n'),
    read_opcao(Opcao),
    validar_objetivo(Opcao).

% Perguntar sobre a experiência
perguntar_experiencia :- 
    write('Qual é sua experiência na academia?\n'),
    write('1. Iniciante\n'),
    write('2. Intermediário\n'),
    write('3. Avançado\n'),
    read_opcao(Opcao),
    validar_experiencia(Opcao).

% Perguntar sobre a disponibilidade de tempo
perguntar_disponibilidade :- 
    write('Qual é sua disponibilidade de tempo para treinar?\n'),
    write('1. Tempo limitado\n'),
    write('2. Tempo moderado\n'),
    write('3. Tempo livre\n'),
    read_opcao(Opcao),
    validar_disponibilidade(Opcao).

% Perguntar sobre o tipo de treino preferido
perguntar_preferencia_treino :- 
    write('Qual tipo de treino você prefere?\n'),
    write('1. Musculação\n'),
    write('2. Funcional\n'),
    write('3. Aeróbico\n'),
    read_opcao(Opcao),
    validar_preferencia_treino(Opcao).

% Ler entrada do usuário como string e converter para número
read_opcao(Opcao) :- 
    read_line_to_string(user_input, Input), 
    number_string(Opcao, Input).

% Validar objetivo
validar_objetivo(1) :- assert(objetivo(ganhar_massa)), !.
validar_objetivo(2) :- assert(objetivo(emagrecer)), !.
validar_objetivo(3) :- assert(objetivo(condicionamento)), !.
validar_objetivo(_) :- 
    write('Opção inválida. Por favor, escolha novamente.\n'),
    perguntar_objetivo.

% Validar experiência
validar_experiencia(1) :- assert(experiencia(iniciante)), !.
validar_experiencia(2) :- assert(experiencia(intermediario)), !.
validar_experiencia(3) :- assert(experiencia(avancado)), !.
validar_experiencia(_) :- 
    write('Opção inválida. Por favor, escolha novamente.\n'),
    perguntar_experiencia.

% Validar disponibilidade
validar_disponibilidade(1) :- assert(disponibilidade(tempo_limitado)), !.
validar_disponibilidade(2) :- assert(disponibilidade(tempo_moderado)), !.
validar_disponibilidade(3) :- assert(disponibilidade(tempo_livre)), !.
validar_disponibilidade(_) :- 
    write('Opção inválida. Por favor, escolha novamente.\n'),
    perguntar_disponibilidade.

% Validar preferência de treino
validar_preferencia_treino(1) :- assert(preferencia_treino(musculacao)), !.
validar_preferencia_treino(2) :- assert(preferencia_treino(funcional)), !.
validar_preferencia_treino(3) :- assert(preferencia_treino(aerobico)), !.
validar_preferencia_treino(_) :- 
    write('Opção inválida. Por favor, escolha novamente.\n'),
    perguntar_preferencia_treino.

% Gerar recomendações com base nas preferências
gerar_recomendacoes :- 
    (findall((Nome, Detalhes), treino(Nome, Detalhes), Treinos), Treinos \= [] -> 
        listar_treinos(Treinos);
        write('Não foi possível encontrar treinos com as preferências informadas.\n')).

% Listar os treinos recomendados
listar_treinos([]).
listar_treinos([(Nome, Detalhes)|T]) :- 
    format('Recomendação: ~w\n', [Nome]), 
    write('Plano de Treino:\n'), 
    listar_detalhes(Detalhes), 
    listar_treinos(T).

% Listar os detalhes de cada treino
listar_detalhes([]). % Caso base: lista vazia
listar_detalhes([Detalhe|Resto]) :- % Caso recursivo: processar a lista
    format('  - ~w\n', [Detalhe]), % Exibe cada detalhe formatado
    listar_detalhes(Resto). % Continua com o resto da lista