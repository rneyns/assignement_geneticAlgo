%redundant script to create figures for the report

data = load(['datasets/rondrit127.tsp']);
x=data(:,1)/max([data(:,1);data(:,2)]);
y=data(:,2)/max([data(:,1);data(:,2)]);
NVAR=size(data,1);
best_arrayf = zeros(11,11)


for i = 0:1:10
    for j = 0:1:10
        besti = run_ga2(x,y,5,100,127,0.05,i/10,j/10,'HX1',0.4);
        best_arrayf(i+1,j+1) = besti; 
    end
end
%%
percentage_crossover = 0:10:100;
percentage_crossover2 = 100:-10:0;
[X,Y] = meshgrid(0:10:100,0:10:100);
best_arrayf(1,1) = 20;
figure;
surf(X,Y,best_arrayf)
zlim([0 15])
xlabel("% mutation")
ylabel("% crossover")
zlabel("shortest route length")