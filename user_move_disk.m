function [ hanoi_towers ] = user_move_disk( hanoi_towers, n )
%USER_MOVE_DISK User interaction to move a disk from one tower to another tower
%   This will request input from the user to get the source and target towers
% First of all, print the actual hanoi towers
display_hanoi_towers(hanoi_towers);

% Simple message
disp('');
disp('===========');
disp('Move a disk');
disp('===========');
% Request the user to enter the source pin, from which the disk will be removed
raw_string = input('Enter the source pin whose disk you want to move, then the target disk ( example = 12 or 23 or 31 ): ', 's');
% Repeat the same input, until the user enters a valid number (1, 2 or 3)
while (~is_valid(raw_string))
    % Display the message and check again
    disp('Try again');
    % Get the numbers again
    raw_string = input('Enter the source pin whose disk you want to move, then the target disk ( example = 12 or 23 or 31 ): ', 's');
end
source_n = str2num(raw_string(1));
target_n = str2num(raw_string(2));
% After having valid source and target, proceed to move the disk (Function below)
hanoi_towers = move_disk(hanoi_towers, source_n, target_n, n);
end

function [ hanoi_towers ] = move_disk( hanoi_towers, source_pin, target_pin, n )
%MOVE_DISK Moves a disk from a pin to another pin
%   Removes the disk from source pin and put it in the target pin
% If the source is equal to the target, print an error message
if (source_pin == target_pin)
    disp('Source pin is equal to target pin, please choose different ones');
else
    % If they are different
    % Get the disk that will be moved: minimum (smallest) disk from the source pin,
    % get also its index
    [ source_disk, source_disk_index ] = min(hanoi_towers(:, source_pin));
    % Get the minimum disk of the target pin, to check if its possible to move the disk
    [ dest_disk, ~ ] = min(hanoi_towers(:, target_pin));
    % If the smaller disk on destination is smaller than the disk that will be moved there,
    % then it is not a valid move, warns the user and does not move the disk
    if(dest_disk < source_disk)
        disp('Warning: Invalid move');
        disp('Source disk is bigger than the top disk on target pin, please choose different ones');
    else
        % If it is posible to move it,
        % Remove the disk from the source pin (intmax('uint8' is the "non-disk" value))
        hanoi_towers(source_disk_index, source_pin) = intmax('uint8');
        % And lastly, put the disk on the target pin (Function below)
        hanoi_towers(:, target_pin) = put_disk(hanoi_towers(:, target_pin), source_disk, n);
    end
end
end

function [ pin ] = put_disk( pin, disk, n )
%PUT_DISK Insert the disk into the pin
%   Insert the disk into the right position inside the pin
% Get the smallest disk in the pin
[ min_disk, disk_index ] = min(pin);
% If the smallest disk is intmax('uint8'), it means that the pin was empty,
% so the place to insert the disk will be on the bottom
if (min_disk == intmax('uint8'))
    disk_index = n + 1; % Add 1, to supress the '- 1' below
end
% The disk will be placed on top of the smallest disk index
pin(disk_index - 1) = disk;
end

function [response] = is_valid(raw_string)
%IS_VALID checks if user input is valid and prints why it's not
if(length(raw_string) ~= 2)
    disp('You need to enter two characters, like 12 or 23');
    response = false;
    return;
end
[source_n, is_a_number] = str2num(raw_string(1));
if(~is_a_number)
    disp(['Source: ', source_n, ' is not a number']);
    response = false;
    return;
end
[target_n, is_a_number] = str2num(raw_string(2));
if(~is_a_number)
    disp(['Target: ', target_n, ' is not a number']);
    return;
end
if(source_n < 1 || source_n > 3 || target_n < 1 || target_n > 3)
    disp('Numbers must be between 1 and 3, other values are not pins inside the game');
    response = false;
    return;
end
response = true;
end
