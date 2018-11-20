n1 = [
    5 0
    2 5
    4 8
    9 3
    10 6
    2 9
    8 0
    15 4
    0 6
];

n2 = [
    2 2
    11 7
    0 1
    3 0
    5 2
    11 1
    7 9
    6 2
    6 1
    1 8
];

% Create fuctions and init population
steiner = inicializaSteiner(n2);
[obj, print] = makeFuns(n2, steiner);

n = size(steiner,1); % Chomosome size
pm = 0.1;            % Mutation p
N = 70;              % Pop size
gens = 30;          % Generations

evals = 20; % Evaluate the algorithm n times
best = zeros(evals,gens); % best found

pop = population('i', n, (n - 1) * pm);
pop = min(pop);

for e = 1:evals
    pop = random(pop, N);
    pop = evaluate(pop, obj);

    for g = 1:gens
        pop = tournament(pop);
        pop = crossover(pop);
        pop = mutation(pop);
        pop = evaluate(pop, obj);
        best_gen = get(pop, 'best');
        best(e,g) = best_gen.fitness;
    end
end

best_avg = mean(best, 1);
best_std = std(best, 0, 1);

plot(1:gens, best_avg);
hold on;
plot(1:gens, best_avg + best_std);
plot(1:gens, best_avg - best_std);