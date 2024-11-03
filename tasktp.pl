:- dynamic task/4.

create_task(Id, Description, Responsable) :-
    \+ task(Id, _, _, _),  
    assertz(task(Id, Description, Responsable, false)).


assign_task(Id, Responsable) :-
    retract(task(Id, Description, _, Statut)), 
    assertz(task(Id, Description, Responsable, Statut)). 


mark_task_completed(Id) :-
    retract(task(Id, Description, Responsable, _)),  
    assertz(task(Id, Description, Responsable, true)).  


display_tasks :-
    forall(task(Id, Description, Responsable, Statut),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Responsable: '), write(Responsable), nl,
            write('Statut: '), (Statut -> write('Terminée') ; write('Non terminée')), nl, nl)).


display_tasks_by_user(Responsable) :-
    forall(task(Id, Description, Responsable, Statut),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Statut: '), (Statut -> write('Terminée') ; write('Non terminée')), nl, nl)).


display_completed_tasks :-
    forall(task(Id, Description, Responsable, true),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Responsable: '), write(Responsable), nl,
            write('Statut: Terminée'), nl, nl)).

