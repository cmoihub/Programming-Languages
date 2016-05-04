%% chdir('Users/CraigBook/OneDrive/Documents/Carleton/SYSC3101/Assignments/ass3').

/*---Facts---*/
isa(tweety,canary).
isa(opus,penguin).
isa(ostrich,bird).
isa(penguin,bird).
isa(canary,bird).
isa(robin,bird).
isa(bird,animal).
isa(fish,animal).

hasproperty(animal,covering,skin).
hasproperty(fish,travel,swim).
hasproperty(bird,travel,fly).
hasproperty(bird,covering,feathers).
hasproperty(ostrich,travel,walk).
hasproperty(penguin,travel,walk).
hasproperty(penguin,colour,brown).
hasproperty(canary,colour,yellow).
hasproperty(tweety,colour,white).
hasproperty(robin,colour,red).
hasproperty(robin,sound,sing).

%% base_case
whatProperty(animal,covering,skin).

%% recursion
whatProperty(X,Y,Z):-
	hasproperty(X,Y,Z), % get properties of the subclass
	%% whatProperty(isa(X,S),otherProperty,otherValue),
	nl.

myunion([],[],[]).
myunion([First|List1],[Second|List2],[Y|X]):-
	member(First,List2), not(First = Second),
	Y is First,
	myunion(List1,X).

remove_at([],0,OnlyOne,OnlyOne).
remove_at([First|List],Pos,Item,Remainder):-
	X is 0,
	X + 1,
	Remainder is [List],
	Pos is First,
	remove_at(List,Pos,Item,Remainder).