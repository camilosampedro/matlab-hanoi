function [ response ] = have_won( hanoi_towers )
%HAVE_WON Summary of this function goes here
%   Detailed explanation goes here
[nr, ~] = size(hanoi_towers);
for r = 1:nr
    if(hanoi_towers(r,3) == intmax('uint8'))
        response = false;
        return;
    end
end
response = true;
end

