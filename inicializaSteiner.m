function steiner = inicializaSteiner(nodos)
    a = unique(nodos(:,1));
    b = unique(nodos(:,2));
    n = size(a, 1);
    m = size(b, 1);
    
    pow = zeros(n * m, 2);
    
    el = 1;
    
    for i = 1:n
        for j = 1:m
        	pow(el,:) = [a(i) b(j)];
            el = el + 1;
        end
    end
    
    steiner = setdiff(pow, nodos, 'rows');
end

