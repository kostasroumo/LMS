% 
function [y, e, w] = my_lms(x, d, order, mu)
    % x: noisy input signal
    % d: desired signal
    % order: Order of the filter
    % mu: Learning rate
    % y: output signal
    % e: error signal
    % w: filter weights
    
    len = length(x);
    w = zeros(order, 1); 
    y = zeros(len, 1);   
    e = zeros(len, 1);    
    k = zeros(order, 1);  

    % Process each sample in the signal
    for n = 1:len
        if n < order
            k = [x(n); k(1:end-1)];
        else
            k = [x(n); x(n-1:-1:n-order+1)];
        end

        y(n) = w' * k;
        e(n) = d(n) - y(n);
        w = w + mu * conj(e(n)) * k;
    end
end
