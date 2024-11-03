% Base de connaissances gestion des t�ches
% task(Id, Description, Responsable, Statut).
:- dynamic task/4.

% 1. Pr�dicat pour cr�er une t�che
% create_task(+Id, +Description, +Responsable)
create_task(Id, Description, Responsable) :-
    \+ task(Id, _, _, _),  % V�rifie que l'ID est unique
    assertz(task(Id, Description, Responsable, false)).

% 2. Pr�dicat pour assigner une t�che � un utilisateur
% assign_task(+Id, +Responsable)
assign_task(Id, Responsable) :-
    retract(task(Id, Description, _, Statut)),  % Retire l'ancienne t�che
    assertz(task(Id, Description, Responsable, Statut)).  % Ajoute la t�che mise � jour

% 3. Pr�dicat pour marquer une t�che comme termin�e
% mark_task_completed(+Id)
mark_task_completed(Id) :-
    retract(task(Id, Description, Responsable, _)),  % Retire l'ancienne t�che
    assertz(task(Id, Description, Responsable, true)).  % Ajoute la t�che avec statut mis � jour

% 4. Pr�dicat pour afficher toutes les t�ches
% display_tasks
display_tasks :-
    forall(task(Id, Description, Responsable, Statut),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Responsable: '), write(Responsable), nl,
            write('Statut: '), (Statut -> write('Termin�e') ; write('Non termin�e')), nl, nl)).

% 5. Pr�dicat pour afficher les t�ches assign�es � un utilisateur particulier
% display_tasks_by_user(+Responsable)
display_tasks_by_user(Responsable) :-
    forall(task(Id, Description, Responsable, Statut),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Statut: '), (Statut -> write('Termin�e') ; write('Non termin�e')), nl, nl)).

% 6. Pr�dicat pour afficher les t�ches termin�es
% display_completed_tasks
display_completed_tasks :-
    forall(task(Id, Description, Responsable, true),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Responsable: '), write(Responsable), nl,
            write('Statut: Termin�e'), nl, nl)).

