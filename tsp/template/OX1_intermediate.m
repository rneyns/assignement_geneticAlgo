% low level function for calculating an offspring
% given 2 parent in the Parents - agrument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent

function offspring = OX1_intermediate(parent1,parent2)
   offspring1 = zeros(size(parent1));
   offspring2 = zeros(size(parent1));

   breaking_point1 = 3%randi(length(parent1));
   breaking_point2 = 5%randi(length(parent1));
   
   while breaking_point1 >= breaking_point2
       if breaking_point1 > length(parent1)-2 %% to make sure the break_point 1 is not the last element
            breaking_point1 = randi(length(parent1));
       end
       breaking_point2 = randi(length(parent1));
   end
   offspring1(breaking_point1:breaking_point2) = parent1(breaking_point1:breaking_point2) 
   offspring2(breaking_point1:breaking_point2) = parent2(breaking_point1:breaking_point2) 
   
   rest_P1 = parent1(offspring1 == 0)
   rest_P2 = parent2(offspring2 == 0)
   rest_P1_ordered = [];
   rest_P2_ordered = [];
   parent1b = [parent1(breaking_point2+1:end) parent1(1:breaking_point2)]
   parent2b = [parent2(breaking_point2+1:end) parent2(1:breaking_point2)]
   for i = 1:length(parent1)
       if ismember(parent2b(i),rest_P1)
           rest_P1_ordered = [rest_P1_ordered parent2b(i)];
       end
       if ismember(parent1b(i),rest_P2)
           rest_P2_ordered = [rest_P2_ordered parent1b(i)];
       end
   end
   offspring1(breaking_point2+1:end) = rest_P1_ordered(1:(length(offspring1)-(breaking_point2)));
   offspring1(1:breaking_point1-1) = rest_P1_ordered((length(offspring1)-(breaking_point2-1)):end)
   offspring2(breaking_point2+1:end) = rest_P2_ordered(1:(length(offspring1)-(breaking_point2)));
   offspring2(1:breaking_point1-1) = rest_P2_ordered((length(offspring1)-(breaking_point2-1)):end);
   
   offspring = [offspring1 ; offspring2];
end
