function print_hanoi_pins( hanoi_pins )
%DISPLAY_HANOI_TOWERS Beautify and print the hanoi towers
%   Convert the numbers inside the hanoi towers into disks of that size,
%   then prints it to the user, disks will be printed in a matrix on a
%   window,
% Number of rows and columns, to iterate inside the hanoi towers
[nr, nc] = size(hanoi_pins);
% The maximum size that a disk can have (in squares)
max_disk_size = nr * 2 - 1;
% The center of the disk (To print centered disks)
center_of_the_disk = ceil(max_disk_size / 2);
% Number of required "squares" to print the Hanoi Towers
number_of_horizontal_squares = (nr * 2 - 1) * 3;
% Initialize the beauty hanoi towers with the number_of_horizontal_squares
% columns, it will have enough space to fill the biggest disks
hanoi_pins_pretty = zeros(nr, number_of_horizontal_squares);
% Iterate through rows
for r = 1:nr
    % and columns
    for c = 1:nc
        % Extract the original disk size, inside the hanoi_towers
        disk_size = hanoi_pins(r,c);
        % Change the center of the disk, based on which tower are we in
        fixed_center_of_the_disk = center_of_the_disk + (c - 1) * max_disk_size;
        % 1000 is the value used to recognize the values that are not
        % disks, if the disk_size is 1000, it means that it was not a
        % disk, so the program will print an empty bar (A little brighter 
        % blue than the background)
        if(disk_size == 1000)
            hanoi_pins_pretty(r, fixed_center_of_the_disk) = 2;
        else % If it was indeed a disk
            % Calculate the beginning and the end of the disk, based on the
            % disk size
            beginning_of_disk = fixed_center_of_the_disk - (disk_size - 1);
            end_of_disk = fixed_center_of_the_disk + (disk_size - 1);
            % Fill the disk with yellow
            hanoi_pins_pretty(r, beginning_of_disk:end_of_disk) = 50;
        end
    end
end
% And then show the Beauty Hanoi Towers
image(hanoi_pins_pretty, 'CDataMapping', 'scaled');
disp('-----------------------------------------');
end
