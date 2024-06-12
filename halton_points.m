function set = haltonSeq(n, d)
% Generate first n ponts of a d-dimensional Halton Sequence
% Inputs:   num points n
%           dimension d
% Output:   n * d halton points

    % Use first d primes as bases
    p = primes(100);
    bases = p(1:d);

    set = zeros(n, d);
    for j = 1:d
        for i = 1:n
            set(i, j) = haltonP(i, bases(j));
        end
    end 

end

function r = haltonP(i, b)
% Generator function for Halton Sequence
% Inputs:   index i
%           base b
% Output:   result r

    f = 1;
    r = 0;
    while i > 0
        f = f / b;
        r = r + f * mod(i, b);
        i = floor(i / b);
    end
end

% Test 10 points in 10 dimensions
n = 10;
d = 10;
seq = haltonSeq(n, d);
disp(seq);