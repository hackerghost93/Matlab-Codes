function [y] = RectSignal(time , from , to)

y = zeros(1,length(time));
    for i = 1 : length(time)
       if(time(i) >= from && time(i) <= to) 
          y(i) = 1 ;
       end
    end
   figure ;
   plot(time,y);
   ylim([-1 3])
   xlim([0 200])
end

