function print_hanoi_pins( hanoi_pins )
%DISPLAY_HANOI_TOWERS Beautify and print the hanoi towers
%   Convert the numbers inside the hanoi towers into disks of that size,
%   then prints it to the user
% Number of rows and columns, to iterate inside the hanoi towers
[nr, nc] = size(hanoi_pins);
% Initialize the beauty hanoi towers with space strings of size nr, which is then
% maximum disk size
hanoi_pins_pretty = repmat({repmat('', 1, nr)}, nr, nc);
% Iterate through rows
for r = 1:nr
    % and columns
    for c = 1:nc
        % Extract the original disk size, inside the hanoi_towers
        disk_size = hanoi_pins(r,c);
        % intmax('uint8') is the value used to recognize the values that are not
        % disks, if the disk_size is intmax('uint8'), it means that it was not a
        % disk, so the program will print an empty bar: '|'
        if(disk_size == 1000)
            disk = '‖';
        else % If it was indeed a disk
            % Create a string with '=', repeated the disk_size times. e.g. if
            % disk size is 3, the disk will be '==='
            disk = repmat('◼', 1, disk_size);
        end
        % Asign this beauty disk to the beauty disks matrix
        hanoi_pins_pretty(r,c) = {disk};
    end
end
% The headers are labels that go below each tower
header = {'(1)','(2)','(3)'};
% Concatenate the beauty disks with their headers below
disp_hanoi = [hanoi_pins_pretty; lines; header];
% Simple message to tell the user that their hanoi towers will be printed
disp('----Hanoi pins: -------------------------');
disp('');
% And then show the Beauty Hanoi Towers
disp(disp_hanoi);
disp('-----------------------------------------');
end
