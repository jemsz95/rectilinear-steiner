function [costo, detalle] = costoSteiner(originales, steiner)
    nodes = [originales; steiner];
    [tree, error] = minSpanTree(nodes);
    costo = inf;
    
    if ~error
        costo = sum(tree.Edges.Weight);
    end    
    
    detalle.nodes = nodes;
    detalle.originales = originales;
    detalle.steiner = steiner;
    detalle.minSpan = tree.Edges.EndNodes;
end

