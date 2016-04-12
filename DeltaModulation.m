function [deltaSignal] = DeltaModulation( t , y, Ts ,deltaAmp)
    %Assume initial Start at 0
    deltaSignal = zeros(1,length(y));
    for i = 2:length(y)-1
        if(y(i) - deltaSignal(i-1) > 0)
            deltaSignal(i) = deltaSignal(i-1)+deltaAmp ;
        else
            deltaSignal(i) = deltaSignal(i-1)-deltaAmp;
        end 
    end 
    
    figure ;
    plot(t,y,'red');
    hold on ;
    stairs(t,deltaSignal);
end

