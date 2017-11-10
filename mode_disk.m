function [ hanoi_pins ] = move_disk( hanoi_pins, source_pin, destination_pin )
% Moves a pin from a pin to another pin
%   Detailed explanation goes here
[ disk, disk_index ] = min(hanoi_pins(:, source_pin));
hanoi_pins(disk_index, source_pin) = 0;
hanoi_pins(:, destination_pin) = put_disk(hanoi_pins(:, destination_pin), disk);
end

function [ pin ] = put_disk(pin, disk)
[ min_disk, disk_index ] = min(pin);
if (disk < min_disk)
    % Cannot move this disk, the destination pin has a smaller disk on top
end
% if (disk < 1) SHOULD NOT happen
    % Cannot move this disk, there is not enough space
% end
pin(disk_index - 1) = disk;
end

