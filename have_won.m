function [ response ] = have_won( hanoi_towers )
%HAVE_WON Check if the hanoi_towers have a winning composition
%   Checks if the right tower is completely filled with disks
% Number of disks in the Hanoi Towers (Rows)
[number_of_rows, ~] = size(hanoi_towers);
% Iterate through the disks on the last pin
for r = 1:number_of_rows
    % If the last tower contains an space that is not filled with a disk (a number
    % different to intmax('uint8')), the user has not won.
    if(hanoi_towers(r,3) == intmax('uint8'))
        response = false;
        % Break the loop here, because we already know that the user has not won.
        return;
    end
end
% If all of the spaces on the right tower were disks, the user has won
response = true;
end
