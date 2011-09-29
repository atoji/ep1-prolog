analisador_lexico( Atomo, Lexicos ) :-
	atom( Atomo ),		   % predicado built-in: é átomo (não número)
	atom_chars( Atomo, As ),  % idem: transforma átomo em lista de chars
	filtra_brancos( As, A1s ), % elimina brancos
	analex( Lexicos, A1s, [] ).

filtra_brancos( [], [] ) :- !.
filtra_brancos( [ B | Bs ], As ) :-
	branco( B ),
	!,
	filtra_brancos( Bs, As ).
filtra_brancos( [ A | Bs ], [ A | As ] ) :-
	!,
	filtra_brancos( Bs, As ).

branco( ' ' ).        % espaço em branco
branco( '	' ).  % tab
branco( '
').                   % new-line


%%% O analisador léxico propriamente dito
analex( [ L | Ls ] ) -->
	item_lexico( L ),
	!,                    % evita backtracking na lista vazia
	analex( Ls ).
analex( [] ) --> [].

item_lexico( = ) --> [ = ].
item_lexico( '(' ) --> [ '(' ].
item_lexico( ')' ) --> [ ')' ].
item_lexico( X ) -->
	[X],
	{ operador( X ) }.
item_lexico( int( N ) ) -->
	[ D ],
	{ digito( D ) },
	inteiro( Ds ),
	{ number_chars( N, [ D | Ds ] ) }. % predicado builtin que transforma
                                           % numeros em listas de atomos e
                                           % vice-versa
item_lexico( pos( N ) ) -->
	[ '$', D ],
	{ digito( D ) },
	inteiro( Ds ),
	{ number_chars( N, [ D | Ds ] ) }.

inteiro( [ D | Ds ] ) -->
	[ D ],
	{ digito( D ) },
	!,             % não-digitos terminam o inteiro
	inteiro( Ds ).
inteiro( [] ) --> [].  % fim de número, não-digito encontrado.

% predicados auxiliares na análise léxica
operador( + ).
operador( - ).
operador( * ).
operador( / ).

digito( '0' ).
digito( '1' ).
digito( '2' ).
digito( '3' ).
digito( '4' ).
digito( '5' ).
digito( '6' ).
digito( '7' ).
digito( '8' ).
digito( '9' ).

%%% testes
teste:-analisador_lexico( '= 32+ 4/($1- 721)', Ys ), writeq(Ys), nl.
