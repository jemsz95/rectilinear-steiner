function [obj, prnt] = makeFuns(original, steiner)
    function res = objective(x)
        filter = de2bi(x) == 1;
        [res, ~] = costoSteiner(original, steiner(filter, :));
        
        % Check that the solution is valid
        if res == Inf
            [res, ~] = reinterpret(filter);
        end
    end

    function print(x)
        filter = de2bi(x) == 1;
        [res, details] = costoSteiner(original, steiner(filter, :));
        
        if res == inf
            [~, details] = reinterpret(filter);
        end
        
        graficaSteiner(details);
    end

    function [res, details] = reinterpret(filter)
        res = Inf;
        i = 1;
        % Check that the solution is valid
        while res == Inf
            % Reinterpret the genotype
            if ~filter(i)
                filter(i) = true;
                [res, details] = costoSteiner(original, steiner(filter, :));
            end
            i = i + 1;
        end
    end

    obj = @objective;
    prnt = @print;
end