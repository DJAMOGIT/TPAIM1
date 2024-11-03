:- dynamic task/4.

create_task(Id, Description, Responsable) :-
    \+ task(Id, _, _, _),  % Vérifie que l'ID est unique
    assertz(task(Id, Description, Responsable, false)).


assign_task(Id, Responsable) :-
    retract(task(Id, Description, _, Statut)),  % Retire l'ancienne tâche
    assertz(task(Id, Description, Responsable, Statut)). 


mark_task_completed(Id) :-
    retract(task(Id, Description, Responsable, _)),  % Retire l'ancienne tâche
    assertz(task(Id, Description, Responsable, true)).  % Ajoute la tâche avec statut mis à jour


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

