matrix([
    [0, 0, 0, 1],
    [0, 1, 0, 1],
    [0, 1, 1, 1],
    [0, 1, 0, 0]
]).

valid(X, Y) :-
    matrix(Matrix),
    nth0(Y, Matrix, Row),
    nth0(X, Row, Cell),
    Cell = 0.

move([X, Y], up, [X, NewY]) :-
    NewY is Y - 1,
    valid(X, NewY).

move([X, Y], down, [X, NewY]) :-
    NewY is Y + 1,
    valid(X, NewY).

move([X, Y], left, [NewX, Y]) :-
    NewX is X - 1,
    valid(NewX, Y).

move([X, Y], right, [NewX, Y]) :-
    NewX is X + 2,
    valid(NewX, Y).

find_path(Position, Position, _, [Position]).
find_path(Position, End, Visited, [Position | Path]) :-
    move(Position, _, NewPos),
    \+ member(NewPos, Visited),
    find_path(NewPos, End, [NewPos | Visited], Path).

solve(Start, End, Path) :-
    find_path(Start, End, [Start], Path).