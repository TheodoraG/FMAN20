function [result] = funct_new(x,f)
    %f = [3 4 7 4 3 5 6];
    result  = 0;
    for i=1:7
        result = result + funct(x-i)*f(i);
    end
end

