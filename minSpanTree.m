function [res, error] = minSpanTree(vals)
    s = size(vals,1);
    adjMat = zeros(s);
    
    for i = 1:s
        for j = 1:s
            if any(vals(i,:) == vals(j,:))
                adjMat(i,j) = sqrt(sum((vals(i,:) - vals(j,:)) .^ 2));
            end
        end
    end
    
    g = graph(adjMat);
    
    res = minspantree(g);
    error = any(conncomp(g) ~= 1);
end

