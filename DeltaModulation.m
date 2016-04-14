function [deltaSignal] = DeltaModulation( t , y, Ts ,deltaAmp)
    %Assume initial Start at 0
    deltaSignal = zeros(1,length(y));
    deltas = zeros(1,length(y));
    for i = 2:length(y)-1
        if(y(i) - deltaSignal(i-1) > 0)
            deltaSignal(i) = deltaSignal(i-1)+deltaAmp ;
            deltas(i) = 1 ;
        else
            deltaSignal(i) = deltaSignal(i-1)-deltaAmp;
            deltas(i) = 0 ;
        end 
    end 
    
    figure ;
    subplot(2,1,1);
    plot(t,y,'red');
    hold on ;
    stairs(t,deltaSignal);
    title('Input vs Output signal');
    hold off ;
    subplot(2,1,2);
    stairs(t,deltas);
    ylim([-1 2])
    grid on ;
    title('deltaModulated signal');
    xlabel('time each step is Ts');
    ylabel('binary Symbol NRZ');
end

