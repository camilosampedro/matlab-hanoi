%% Main script of Hanoi Towers
% Show a input message for the number of disks to create the Hanoi Towers
disp('Welcome to the Hanoi Towers game');
disp('================================');
number_of_disk_string = input('Enter the number of disks ( n >= 3 ): ', 's');
[number_of_disks, is_a_number] = str2num(number_of_disk_string);
% Keep asking for the number of disks while the user input is invalid
while (~is_a_number || number_of_disks < 3)
    % If it is invalid because it was not a number
    if(~is_a_number)
        disp('Warning: A non-numeric number of disks entered');
    else % Or it is a number lower than 3
        disp('Warning: Input must be greater than 3');
    end
    disp('Please check it and try again');
    % Ask again for a number, and recheck the while condition
    number_of_disk_string = input('Enter the number of disks ( n >= 3 ): ', 's');
    [number_of_disks, is_a_number] = str2num(number_of_disk_string);
end

%% Initial Hanoi Towers creation
% Create empty Hanoi Towers (Filled with zeros).
hanoi_towers = zeros(number_of_disks, 3);
% Change every number for the maximum integer.
% This is to check the minimum disk on the towers, without
% conflicts with the zeros.
hanoi_towers(1:end, 1:end) = intmax('uint8');
% The left tower will be filled with 1 to number of disks
hanoi_towers(:, 1) = 1:number_of_disks;

%% Movements
% Loop the user interaction until the user wins
number_of_moves = 0;
while (~is_a_winning_config(hanoi_towers))
    hanoi_towers = user_move_disk(hanoi_towers, number_of_disks);
    number_of_moves = number_of_moves + 1;
end

%% User won
% Winning message!
disp('');
disp('=============================');
disp('=============================');
disp('CONGRATULATIONS! You have won');
disp('=============================');
disp('=============================');
disp(['You won in ', num2str(number_of_moves), ' moves.']);
display_hanoi_towers(hanoi_towers);
