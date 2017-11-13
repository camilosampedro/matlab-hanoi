function [ hanoi_towers ] = user_move_disk( hanoi_towers, n )
%USER_MOVE_DISK Summary of this function goes here
%   Detailed explanation goes here
display_hanoi_towers(hanoi_towers);
disp('');
disp('===========');
disp('Move a disk');
disp('===========');
source = input('Enter the source pin whose disk you want to move ( source = 1, 2, 3 ): ', 's');
[source_n, successful] = str2num(source);
while (~successful || source_n < 1 || source_n > 3)
    if(~successful)
        disp('Warning: A non-numeric source pin as input');
    else
        disp('Warning: Input must be between 1 and 3');
    end
    disp('Please check it and try again');
    source = input('Enter the source pin whose disk you want to move ( source = 1, 2, 3 ): ', 's');
    [source_n, successful] = str2num(source);
end
target = input('Enter the target pin whose disk you want to move ( target = 1, 2, 3 ): ', 's');
[target_n, successful] = str2num(target);
while (~successful || source_n < 1 || source_n > 3)
    if(~successful)
        disp('Warning: A non-numeric target pin as input');
    else
        disp('Warning: Input must be between 1 and 3');
    end
    disp('Please check it and try again');
    target = input('Enter the target pin whose disk you want to move ( target = 1, 2, 3 ): ', 's');
    [target_n, successful] = str2num(target);
end
hanoi_towers = move_disk(hanoi_towers, source_n, target_n, n);
end

function [ hanoi_pins ] = move_disk( hanoi_pins, source_pin, destination_pin, n )
% Moves a pin from a pin to another pin
%   Detailed explanation goes here
if(source_pin == destination_pin)
    disp('Source pin is equal to target pin, please choose different ones');
else
    [ source_disk, source_disk_index ] = min(hanoi_pins(:, source_pin));
    [ dest_disk, ~ ] = min(hanoi_pins(:, destination_pin));
    if(dest_disk < source_disk)
        disp('Warning: Invalid move');
        disp('Source disk is bigger than the top disk on target pin, please choose different ones');
    else
        hanoi_pins(source_disk_index, source_pin) = intmax('uint8');
        hanoi_pins(:, destination_pin) = put_disk(hanoi_pins(:, destination_pin), source_disk, n);
    end
end
end

function [ pin ] = put_disk( pin, disk, n )
[ min_disk, disk_index ] = min(pin);
if (min_disk == intmax('uint8'))
    disk_index = n + 1;    
end
pin(disk_index - 1) = disk;
end
