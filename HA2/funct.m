function [func] = funct(x)
%g(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if abs(x)<=1
        func = abs(x)^3-2*abs(x)^2+1;
    else if abs(x)<=2
        func = -abs(x)^3+5*abs(x)^2-8*abs(x)+4;
        else 
            func = 0;
        end
    end
end

