function display_hanoi_towers( hanoi_towers )
%DISPLAY_HANOI_TOWERS Summary of this function goes here
%   Detailed explanation goes here
header = {'Pin_1','Pin_2','Pin_3'};
[nr, nc] = size(hanoi_towers);
beauty_disks = repmat({repmat(' ', 1, nr)}, nr, nc);
for r = 1:nr
    for c = 1:nc
        disk_size = hanoi_towers(r,c);
        if(disk_size == intmax('uint8'))
            disk = '|';
        else
            disk = repmat('=', 1, hanoi_towers(r,c));
        end
        beauty_disks(r,c) = {disk};
    end
end
disp_hanoi = [beauty_disks; header];
disp('These are your hanoi towers: ');
disp(disp_hanoi);
end

