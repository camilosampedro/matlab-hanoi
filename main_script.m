%% Main script of Hanoi Towers
% Show a input message for the number of disks to create the Hanoi Towers
number_of_disk_string = input('Enter the number of disks ( n >= 3 ): ', 's');
[n, is_a_number] = str2num(number_of_disk_string);
% Keep asking for the number of disks while the user input is invalid
while (~is_a_number || n < 3)
    % If it is invalid because it was not a number
    if(~is_a_number)
        disp('Warning: A non-numeric number of disks entered');
    else % Or it is a number lower than 3
        disp('Warning: Input must be greater than 3');
    end
    disp('Please check it and try again');
    % Ask again for a number, and recheck the while condition
    number_of_disk_string = input('Enter the number of disks ( n >= 3 ): ', 's');
    [n, successful] = str2num(number_of_disk_string);
end

% Create empty Hanoi Towers (Filled with zeros).
hanoi_towers = zeros(n, 3);
% Change every number for the maximum integer.
% This is to check the minimum disk on the towers, without
% conflicts with the zeros.
hanoi_towers(1:end, 1:end) = intmax('uint8');
% The left tower will be filled with 1 to number of disks
hanoi_towers(:, 1) = 1:n;
% Display the initial Hanoi Towers
display_hanoi_towers(hanoi_towers);

% Loop the user interaction until the user wins
while (~have_won(hanoi_towers))
    hanoi_towers = user_move_disk(hanoi_towers, n);
end

% Winning message!
disp('');
disp('=============================');
disp('=============================');
disp('CONGRATULATIONS! You have won');
disp('=============================');
disp('=============================');
display_hanoi_towers(hanoi_towers);
