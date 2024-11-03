% Base de connaissances gestion des tâches
% task(Id, Description, Responsable, Statut).
:- dynamic task/4.

% 1. Prédicat pour créer une tâche
% create_task(+Id, +Description, +Responsable)
create_task(Id, Description, Responsable) :-
    \+ task(Id, _, _, _),  % Vérifie que l'ID est unique
    assertz(task(Id, Description, Responsable, false)).

% 2. Prédicat pour assigner une tâche à un utilisateur
% assign_task(+Id, +Responsable)
assign_task(Id, Responsable) :-
    retract(task(Id, Description, _, Statut)),  % Retire l'ancienne tâche
    assertz(task(Id, Description, Responsable, Statut)).  % Ajoute la tâche mise à jour

% 3. Prédicat pour marquer une tâche comme terminée
% mark_task_completed(+Id)
mark_task_completed(Id) :-
    retract(task(Id, Description, Responsable, _)),  % Retire l'ancienne tâche
    assertz(task(Id, Description, Responsable, true)).  % Ajoute la tâche avec statut mis à jour

% 4. Prédicat pour afficher toutes les tâches
% display_tasks
display_tasks :-
    forall(task(Id, Description, Responsable, Statut),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Responsable: '), write(Responsable), nl,
            write('Statut: '), (Statut -> write('Terminée') ; write('Non terminée')), nl, nl)).

% 5. Prédicat pour afficher les tâches assignées à un utilisateur particulier
% display_tasks_by_user(+Responsable)
display_tasks_by_user(Responsable) :-
    forall(task(Id, Description, Responsable, Statut),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Statut: '), (Statut -> write('Terminée') ; write('Non terminée')), nl, nl)).

% 6. Prédicat pour afficher les tâches terminées
% display_completed_tasks
display_completed_tasks :-
    forall(task(Id, Description, Responsable, true),
           (write('ID: '), write(Id), nl,
            write('Description: '), write(Description), nl,
            write('Responsable: '), write(Responsable), nl,
            write('Statut: Terminée'), nl, nl)).

