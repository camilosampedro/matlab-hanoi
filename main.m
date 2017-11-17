%% Main script of Hanoi Towers
% Show a input message for the number of disks to create the Hanoi Towers
number_of_disk_string = input('Initial tower height ( n >= 3 ): ', 's');
[n, is_a_number] = str2num(number_of_disk_string);
% Keep asking for the number of disks while the user input is invalid
while (~is_a_number || n < 3)
    % If it is invalid because it was not a number
    if(~is_a_number)
        disp('Error: Your input was not a number');
    else % Or it is a number lower than 3
        disp('Error: The number must be greater or equal to 3');
    end
    disp('Try again');
    % Ask again for a number, and recheck the while condition
    number_of_disk_string = input('Enter the number of disks ( n >= 3 ): ', 's');
    [n, is_a_number] = str2num(number_of_disk_string);
end

hanoi_pins = initialize_hanoi(n);

%% Movements
% Loop the user interaction until the user wins
menu(hanoi_pins);

%% Alert the user that they won!
disp(' __ ___ _ _  __ _ _ _ __ _| |_ _  _| |__ _| |_(_)___ _ _  ___');
disp('/ _/ _ | '' \/ _` | ''_/ _` |  _| || | / _` |  _| / _ | '' \(_-<');
disp('\__\___|_||_\__, |_| \__,_|\__|\_,_|_\__,_|\__|_\___|_||_/__/');
disp('            |___/                                            ');
disp('You have won');
print_hanoi_pins(hanoi_pins);
