function [ response ] = have_won( hanoi_pins )
%HAVE_WON Check if all the disks are in the left pin
% First get the height of the towers
[nr, ~] = size(hanoi_pins);
% Go disk per disk on the right tower
for r = 1:nr
    % 1000 is the number to recognize the positions that are not disks
    % if any of the positions on the right pin has a 1000, then the user
    % has not won
    if(hanoi_pins(r,3) == 1000)
        response = false;
        % If this condition is gotten once, break the loop, it is not
        % neccesary to continue it
        return;
    end
end

% If no '1000' were found on the right pin, then the user has won
response = true;
end
