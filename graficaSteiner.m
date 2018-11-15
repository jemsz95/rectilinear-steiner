function graficaSteiner(costoData)
    clf()
    hold on;
    
    if size(costoData.originales, 2) > 1
        scatter(costoData.originales(:,1), costoData.originales(:,2));
    end
    
    if size(costoData.steiner, 2) > 1
        scatter(costoData.steiner(:,1), costoData.steiner(:,2), 'fill');
    end

    for edge = costoData.minSpan'
        plot(costoData.nodes(edge,1), costoData.nodes(edge,2));
    end
    
    hold off;
end

