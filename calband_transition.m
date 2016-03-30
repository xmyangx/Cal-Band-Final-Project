function [instructions] = calband_transition(initial_formation, ...
target_formation, max_beats)
%max steps that can be taken; there are 2 beats to a step
max_steps = max_beats/2;
%number of marchers
nb = max(max(initial_formation));

%find the distances;gets a cell of arrays for each person; index # is the
%tag for each marcher
[distances,wait_times] = subtraction(initial_fomation,target_formation,max_steps,nb);

%determine optimum placements of the various marchers; collision checker
%inside the placement function



end
