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
    [n, is_a_number] = str2num(number_of_disk_string);
end

hanoi_pins = initialize_hanoi(n);

%% Movements
% Loop the user interaction until the user wins
menu(hanoi_pins);

%% User won
% Winning message!
disp('');
disp('=============================');
disp('=============================');
disp('CONGRATULATIONS! You have won');
disp('=============================');
disp('=============================');
display_hanoi_towers(hanoi_pins);
