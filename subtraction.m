function [ distance_arrays, wait_times ] = subtraction( initial_formation, target_formation, max_steps, nb)
%outputs both a distance and wait time array within a cell array
%the cell array corresponds to each member
%aka cell{1} would be all the data for member 1, distance & wait time wise
%written by Katherine Cheng 

%find the indices of all the target placements in target formation
[rowt,colt]=find(target_formation==1);
%create the empty cell array for pure distances to be used later 
distance=cell(1,nb);
for i=1:nb
    %for member i, get their initial indices
    [m,n]=find(initial_formation==i);
    %dummy array to be indexed into distance later
    dummy=[];
    for k=1:nb
        %gets the abs value differences between the rows and column indices
        x=abs(rowt(k)-m);
        y=abs(colt(k)-n);
        %now add onto the dummy array each time to form a column vector
        dummy=[dummy;(x+y)];
    end
    %index it into the distance cell, corresponding to each member
    distance(i)={dummy};
end
%now to make the distance arrays based on the target matrix
%first make empty cell array to contain each distance array
distance_arrays=cell(1,nb);
for i=1:nb
    %index out the steps needed from distance column vector cell array
    stepsneeded=distance{i};
    %dummy variable again, this time making a copy of target formation 
    dunce=target_formation;
    for k=1:nb
        %index into the dunce at every target, how many steps needed to get
        %there 
        dunce(rowt(k),colt(k))=stepsneeded(k);
    end
    %then index the dunce array into the distance_arrays cell
    distance_arrays(i)={dunce};
end
%new empty cell array for wait times, same pattern as above 
wait_times=cell(1,nb);
for i=1:nb
    %index out steps needed again 
      stepsneeded=distance{i};
      %dummy variable making a copy of target formation 
    dupe=target_formation;
    for k=1:nb
        %index into each area of target formation the wait times
        %negative wait times means an "impossible target"
        dupe(rowt(k),colt(k))=(max_steps-stepsneeded(k));
    end 
    %index array into wait times cell
    wait_times(i)={dupe};
end 
end

