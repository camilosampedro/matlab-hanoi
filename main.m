%% Hanoi game
% Get the tower height, a number greater than 3
number_of_disk_string = inputdlg('Enter the number of disks to play with: ', 'Number of disks');
% Check if it is a number
[n, is_a_number] = str2num(cell2mat(number_of_disk_string));
% If it is not, prompt for it until it is a number or it is greater or
% equal to 3
while (~is_a_number || n < 3)
    % It was invalid because it was not a number
    if(~is_a_number)
        waitfor(msgbox('Error: What you entered was not a number'));
    else
        % It was lower than 3
        waitfor(msgbox('Error: You need at least 3 disks to play Hanoi Towers'));
    end
    % Prompt for it again and repeat the loop
    number_of_disk_string = inputdlg('Enter the number of disks to play with: ', 'Number of disks');
    [n, is_a_number] = str2num(cell2mat(number_of_disk_string));
end

% With n, initialize the hanoi matrix
hanoi_pins = initialize_hanoi(n);

%% Menu
% Repeated while user has not won
hanoi_pins = menu(hanoi_pins, n);

%% Alert the user that they won!
msgbox('You have won!');
print_hanoi_pins(hanoi_pins);
