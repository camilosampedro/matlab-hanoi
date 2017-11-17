function [ hanoi_towers ] = move_disk( hanoi_towers )
%MOVE_DISK All the hanoi towers magic goes here
%   Request source and target pins to move a disk
% Print the actual state of the game
print_hanoi_pins(hanoi_towers);

% Before requesting the user
disp('');
disp('');
disp('Next move');
disp('◼◼◼◼◼◼◼◼◼');
% Ask the user for the pin that the disk will be taken from
source = input('Select a source pin ( (1), (2) or (3) ): ', 's');
% As main, try to read a number from user input
[source_n, is_a_number] = str2num(source);
% While it is not a number or it is not 1, 2 or 3
while (~is_a_number || source_n < 1 || source_n > 3)
    % If the error was because it was not a number
    if(~is_a_number)
        disp('Error: Your input was not a number');
    else
        % Or if it was not in the valid range
        disp('Error: The number must be 1, 2 or 3');
    end
    disp('Try again');
    % Ask again for the number
    source = input('Select a source pin ( (1), (2) or (3) ): ', 's');
    % And try to read the number
    [source_n, is_a_number] = str2num(source);
end
% Ask the user for the pin that the disk will be taken from
target = input('Select a target pin ( (1), (2) or (3) ): ', 's');
% As main, try to read a number from user input
[target_n, is_a_number] = str2num(target);
% While it is not a number or it is not 1, 2 or 3
while (~is_a_number || source_n < 1 || source_n > 3)
    % If the error was because it was not a number
    if (~is_a_number)
        disp('Error: Your input was not a number');
    else
        % Or if it was not in the valid range
        disp('Error: The number must be 1, 2 or 3');
    end
    disp('Try again');
    % Ask again for the number
    target = input('Select a target pin ( (1), (2) or (3) ): ', 's');
    % And try to read the number
    [target_n, is_a_number] = str2num(target);
end
% With source and target, perform the movement
hanoi_towers = perform_movement(hanoi_towers, source_n, target_n);
end

function [ hanoi_towers ] = perform_movement( hanoi_towers, source_pin, target_pin)
%PERFORM_MOVEMENT Local function to move a disk from a pin to another pin
%   Deletes the disk from source pin and adds it in the target pin
% It is not possible to move if the source and target are the same
if (source_pin == target_pin)
    disp('Error: Source pin is equal to target pin.');
    disp('Try again.');
else
    % Obtain the smallest disk from source pin and its index
    [ source_disk, source_disk_index ] = min(hanoi_towers(:, source_pin));
    % Obtain the smallest disk from target pin
    [ dest_disk, ~ ] = min(hanoi_towers(:, target_pin));
    % Check if the disk to move from source is bigger than the top disk on
    % target, this would be an invalid move
    if(dest_disk < source_disk)
        disp('Error: The disk that you want to move is bigger than the disk on the target');
        disp('Try again');
    else
        % Put a 1000 (The value for positions that are not disks) on source
        hanoi_towers(source_disk_index, source_pin) = 1000;
        % Add the disk to the target pin
        hanoi_towers(:, target_pin) = add_disk(hanoi_towers(:, target_pin), source_disk);
    end
end
end

function [ pin ] = add_disk( pin, disk )
%ADD_DISK Add the disk on top of the pin
%   Add the disk on top of the pin, the first available spot from bottom to
%   top
% Get the smallest disk
[ min_disk, disk_index ] = min(pin);
% If min_disk is 1000, the pin is empty
if (min_disk == 1000)
    % Add the disk on bottom
    n = size(pin, 1);
    % + 1, to avoid index errors
    disk_index = n + 1;
end
% Add it on the position above the smallest disk
pin(disk_index - 1) = disk;
end
