calcula_lista(L, R) :- calcula_lista(L, [], R).

calcula_lista([], R, Lf) :- Lf = R.

calcula_lista([H|T], Li, Lf) :-
  calcula_valor(H, Li, R),
  append(Li, [R], Zs),
  calcula_lista(T, Zs, Lf).

calcula_valor( soma(X, Y), L, R ) :-
  calcula_valor(X, L, R1),
  calcula_valor(Y, L, R2),
  R is R1 + R2.

calcula_valor( sub(X, Y), L, R ) :-
  calcula_valor(X, L, R1),
  calcula_valor(Y, L, R2),
  R is R1 - R2.
  
calcula_valor( mult(X, Y), L, R ) :-
  calcula_valor(X, L, R1),
  calcula_valor(Y, L, R2),
  R is R1 * R2.

calcula_valor( div(X, Y), L, R ) :-
  calcula_valor(X, L, R1),
  calcula_valor(Y, L, R2),
  R is R1 / R2.
  
calcula_valor( pos(X), Ls, R ) :-
  nth(X, Ls, R).

calcula_valor( X, _, R ) :-
  R is X.
  
nth(N, List, Element):-
  N1 is N - 1,
  length(Head, N1),
  append(Head, [Element|_Rest], List).

