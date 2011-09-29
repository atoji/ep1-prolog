calcula_valor(soma(1, 1), [], R), write(R), write(2).

calcula_valor(soma(1, soma(1, 1)), [], R), write(R), write(3).

calcula_valor(soma(1, soma(1, soma(1,1))), [], R), write(R), write(4).

calcula_valor(sub(1, 1), [], R), write(R), write(0).

calcula_valor(mult(1, 1), [], R), write(R), write(1).

calcula_valor(div(1, 1), [], R), write(R), write(1).

calcula_valor(soma(3, div(10, soma(1, 1))), [], R), write(R), write(8).

calcula_valor(pos(1), [1], R), write(R), write(1).

calcula_lista([soma(1, 1), soma(1, 1)], R), write(R), write([2, 2]).

calcula_lista([soma(1, 3), soma(2, 1)], R), write(R), write([4, 3]).

calcula_lista([soma(1, 3), pos(1)], R), write(R), write([4, 4]).


