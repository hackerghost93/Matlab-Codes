function [ Error ] = RootMeanSquare( y , d )
    z = y - d ;
    z = z.^2 ;
    Error = sum(z) ;
end

