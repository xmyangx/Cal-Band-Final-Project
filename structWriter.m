function [instructions] = structWriter(i_target,j_target,wait,direction)
lthing = length(i_target);
instructions(lthing).i_target = i_target(end);
for i = 1:lthing;
    instructions(i).i_target = i_target(i);
    instructions(i).j_target = j_target(i);
    instructions(i).wait = wait(i);
    instructions(i).direction = direction(i);
end
end