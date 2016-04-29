function [time,basis_total,basisNumber] = BasisGenerator(t, y_total)
    dim = size(y_total);
    % number of signals n ;
    time = t ;
    n = dim(1);
    basisNumber = 0 ;
    basis_total = [] ;
    % gram shmeit algorithm
    for iter  = 1 : n 
        % for each signal from the second signal
        % accumulator of this signal
        iterbasis = y_total(iter,:);
        for i = 1 : basisNumber;
            % select the current basis to truncate
            sig = basis_total(i,:);
            % get the dot product
            simularity = dot(sig,y_total(iter,:));
            % normalise the simularity
            % truncate
            iterbasis = iterbasis -( simularity.* sig );
        end
        bool = false ;
        for i = 1 : length(iterbasis)
            % if basis function has value bigger than threshold 
            % put it as a basis function
            if(iterbasis(i) > 10e-6)
                bool = true ;
            end
        end
        if(bool == true)
            norm(iterbasis)
            % normalise it
            iterbasis = iterbasis./norm(iterbasis);
            % concat it to basis we have
            basis_total = [basis_total;iterbasis];
            % increment the number of basis
            basisNumber = basisNumber + 1 ;
        end
    end
     figure ;
     for i = 1 : basisNumber 
         subplot(basisNumber,1,i);
         plot(time,basis_total(i,:));
     end

end

