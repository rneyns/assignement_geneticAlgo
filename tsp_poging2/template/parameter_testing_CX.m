data = load(['datasets/rondrit127.tsp']);
x=data(:,1)/max([data(:,1);data(:,2)]);
y=data(:,2)/max([data(:,1);data(:,2)]);
NVAR=size(data,1);
best_arrayf = zeros(10,10)


for i = 0:10:100
    for j = 0:10:100
        besti = run_ga2(x,y,500,100,127,0.05,i/100,j/100,'OX1',0.4);
        if i < 10 
            if j < 10
               best_arrayf(1,1) = besti; 
            else
               best_arrayf(1,j/10) = besti;
            end
        elseif j < 10
            best_arrayf(i/10,1) = besti;
        else
            best_arrayf(i/10,j/10) = besti;
        end
    end
end
%%
percentage_crossover = 1:10:100;
percentage_crossover2 = 100:-10:1;
figure;
surf(percentage_crossover,percentage_crossover,best_arrayf)
xlabel("% crossover")
ylabel("% mutation")
zlabel("shortest route length")