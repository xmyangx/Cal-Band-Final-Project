function [ distance_arrays, wait_times ] = subtraction( initial_formation, target_formation, max_steps, nb)
[rowt,colt]=find(target_formation==1);
z=length(rowt);
distance=cell(1,nb);
for i=1:nb
    [m,n]=find(initial_formation==i);
    dummy=[];
    for k=1:z
        x=abs(rowt(k)-m);
        y=abs(colt(k)-n);
        dummy=[dummy;(x+y)];
    end
    distance(i)={dummy};
end
distance_arrays=cell(1,nb);
for i=1:nb
    stepsneeded=distance{i};
    dunce=target_formation;
    for k=1:z
        dunce(rowt(k),colt(k))=stepsneeded(k);
    end
    distance_arrays(i)={dunce};
end
wait_times=cell(1,nb);
for i=1:nb
      stepsneeded=distance{i};
    dupe=target_formation;
    for k=1:z
        dupe(rowt(k),colt(k))=(max_steps-stepsneeded(k));
    end 
    wait_times(i)={dupe};
end 
end

