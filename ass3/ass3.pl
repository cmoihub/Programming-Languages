%%chdir('Users/CraigBook/OneDrive/Documents/Carleton/SYSC3101/Assignments/ass3').

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*-Base Case-*/
%whatproperty(animal,covering,skin).

/*Failure Driven Loop*/
whatproperty(Object,Type,Value):-
	hasproperty(Object,Type,Value),
	write(Object),nl,
	write("PropertyType" = Type),nl,
	write("PropertyValue" = Value),nl,fail.

/*Get Properties of Parent*/
whatproperty(Object,Type,Value):-
	nl,isa(Object, Parent),
	whatproperty(Parent, Type, Value).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*---Base Case---*/
myunion([],List,List).

/*Remove duplicates*/
myunion([Element|List1],List2,List3):-
	member(Element,List2),!,
	myunion(List1,List2,List3).

/*Combine lists*/
myunion([Element|List1],List2,[Element|List3]):-
	myunion(List1,List2,List3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*---Base Case---*/
remove_at([First|List],0,First,List).

remove_at([First|List],Pos,Item,[First|Remainder]):-
	Pos > -1,			%lists begin at 0
	NextPos is Pos-1,	%decrement Pos
	remove_at(List,NextPos,Item,Remainder).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%