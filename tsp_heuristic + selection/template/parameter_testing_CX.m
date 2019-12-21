data = load(['datasets/rondrit127.tsp']);
x=data(:,1)/max([data(:,1);data(:,2)]);
y=data(:,2)/max([data(:,1);data(:,2)]);

NVAR=size(data,1); 
best_array = []
percentage_crossover = 0:10:100;
for i = 0:10:100
    besti = run_ga2(x,y,500,100,127,0.05,i/100,0.05,'OX1',false,0.8);
    best_array = [best_array besti];
end

figure;
plot(percentage_crossover,best_array)