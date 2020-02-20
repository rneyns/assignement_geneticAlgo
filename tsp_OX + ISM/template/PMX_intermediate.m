% low level function for calculating an offspring
% given 2 parent in the Parents - agrument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent

function offspring = PMX_intermediate(parent1,parent2)
   possible_numbers = 1:length(parent1);
    
   offspring1 = zeros(size(parent1));
   offspring2 = zeros(size(parent1));

   breaking_point1 = randi(length(parent1));
   breaking_point2 = randi(length(parent1));
   
   while breaking_point1 >= breaking_point2
       if breaking_point1 > length(parent1)-2 %% to make sure the break_point 1 is not the last element
            breaking_point1 = randi(length(parent1));
       end
       breaking_point2 = randi(length(parent1));
   end
   
   %exchanging the middle part of the parents
   offspring1(1:breaking_point1) = parent1(1:breaking_point1);
   offspring1(breaking_point1:breaking_point2) = parent2(breaking_point1:breaking_point2);
   offspring1(breaking_point2:end) = parent1(breaking_point2:end);
   offspring2(1:breaking_point1) = parent2(1:breaking_point1);
   offspring2(breaking_point1:breaking_point2) = parent1(breaking_point1:breaking_point2);
   offspring2(breaking_point2:end) = parent2(breaking_point2:end);
   
   %find out which cities are missing from the list for offspring 1   
   test = offspring1 
   [v, w] = unique( offspring1, 'stable' );
   duplicate_indices = setdiff( 1:numel(offspring1), w );
   missing_values = setdiff(possible_numbers,offspring1);
   
   for k = 1:length(duplicate_indices)
       if duplicate_indices(k) < breaking_point2
           location = find(offspring1 == offspring1(duplicate_indices(k)));
           offspring1(location(1)) = offspring2(duplicate_indices(k));
       else
           location = find(offspring1 == offspring1(duplicate_indices(k)));
           offspring1(duplicate_indices(k)) = offspring2(location(1));
       end
   end
   
   [v, w] = unique( offspring2, 'stable' );
   duplicate_indices = setdiff(1:numel(offspring2), w );
   missing_values = setdiff(possible_numbers,offspring2);
   
   for k = 1:length(duplicate_indices)
       if duplicate_indices(k) < breaking_point2
           location = find(offspring2 == offspring2(duplicate_indices(k)));
           offspring2(location(1)) = offspring1(duplicate_indices(k));
       else
           location = find(offspring2 == offspring2(duplicate_indices(k)));
           offspring2(duplicate_indices(k)) = offspring1(location(1));
       end
   end           
   
   [~, w] = unique( offspring2, 'stable' );
   duplicate_indices = setdiff( 1:numel(offspring2), w );
   missing_values = setdiff(possible_numbers,offspring2);
   
   offspring = [offspring1 ; offspring2];
end
   

   
    
   
           
       
       