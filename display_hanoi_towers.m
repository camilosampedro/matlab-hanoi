function display_hanoi_towers( hanoi_towers )
%DISPLAY_HANOI_TOWERS Beautify and print the hanoi towers
%   Convert the numbers inside the hanoi towers into disks of that size,
%   then prints it to the user
% Number of rows and columns, to iterate inside the hanoi towers
[number_of_rows, number_of_columns] = size(hanoi_towers);
% Initialize the beauty hanoi towers with space strings of size nr, which is then
% maximum disk size
beauty_disks = repmat({repmat(' ', 1, number_of_rows)}, number_of_rows, number_of_columns);
% Iterate through rows
for r = 1:number_of_rows
    % and columns
    for c = 1:number_of_columns
        % Extract the original disk size, inside the hanoi_towers
        disk_size = hanoi_towers(r,c);
        % intmax('uint8') is the value used to recognize the values that are not
        % disks, if the disk_size is intmax('uint8'), it means that it was not a
        % disk, so the program will print an empty bar: '|'
        if(disk_size == intmax('uint8'))
            disk = '|';
        else % If it was indeed a disk
            % Create a string with '=', repeated the disk_size times. e.g. if
            % disk size is 3, the disk will be '==='
            disk = repmat('=', 1, disk_size);
        end
        % Asign this beauty disk to the beauty disks matrix
        beauty_disks(r,c) = {disk};
    end
end
% The headers are labels that go below each tower

header = {'Pin 1','Pin 2','Pin 3'};
% Concatenate the beauty disks with their headers below
disp_hanoi = [beauty_disks; header];
% Simple message to tell the user that their hanoi towers will be printed
disp('These are your hanoi towers: ');
% And then show the Beauty Hanoi Towers
disp(disp_hanoi);
end
