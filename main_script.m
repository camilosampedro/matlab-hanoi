n_string = input('Enter the number of disks ( n >= 3 ): ', 's');
[n, successful] = str2num(n_string);
while (~successful || n < 3)
    if(~successful)
        disp('Warning: A non-numeric number of disks entered');
    else
        disp('Warning: Input must be greater than 3');
    end
    disp('Please check it and try again');
    n_string = input('Enter the number of disks ( n >= 3 ): ', 's');
    [n, successful] = str2num(n_string);
end
hanoi_towers = zeros(n, 3);
hanoi_towers(1:end, 1:end) = intmax('uint8');
hanoi_towers(:, 1) = 1:n;
display_hanoi_towers(hanoi_towers);
while (~have_won(hanoi_towers))
    hanoi_towers = user_move_disk(hanoi_towers, n);
end
disp('');
disp('=============================');
disp('=============================');
disp('CONGRATULATIONS! You have won');
disp('=============================');
disp('=============================');
display_hanoi_towers(hanoi_towers);
