%% Hanoi game
% Title
disp('===[ HANOI TOWERS ]===');
% Get the tower height, a number greater than 3
number_of_disk_string = input('Enter the number of disks to play with: ', 's');
% Check if it is a number
[n, is_a_number] = str2num(number_of_disk_string);
% If it is not, prompt for it until it is a number or it is greater or
% equal to 3
while (~is_a_number || n < 3)
    % It was invalid because it was not a number
    if(~is_a_number)
        disp('Error: What you entered was not a number');
    else
        % It was lower than 3
        disp('Error: You need at least 3 disks to play Hanoi Towers');
    end
    disp('Try again');
    % Prompt for it again and repeat the loop
    number_of_disk_string = input('Enter the number of disks to play with: ', 's');
    [n, is_a_number] = str2num(number_of_disk_string);
end

% With n, initialize the hanoi matrix
hanoi_pins = initialize_hanoi(n);

%% Menu
% Repeated while user has not won
menu(hanoi_pins);

%% Alert the user that they won!
disp(' __ ___ _ _  __ _ _ _ __ _| |_ _  _| |__ _| |_(_)___ _ _  ___');
disp('/ _/ _ | '' \/ _` | ''_/ _` |  _| || | / _` |  _| / _ | '' \(_-<');
disp('\__\___|_||_\__, |_| \__,_|\__|\_,_|_\__,_|\__|_\___|_||_/__/');
disp('            |___/                                            ');
disp('You have won');
print_hanoi_pins(hanoi_pins);
