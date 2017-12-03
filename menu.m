function hanoi_pins = menu( hanoi_pins, n )
%MENU Menu
%   Repeat movements while the user has not won
while (~have_won(hanoi_pins))
    hanoi_pins = move_disk(hanoi_pins);
    % Print the actual state of the game
    print_hanoi_pins(hanoi_pins);
    if(~have_won(hanoi_pins))
        answer = questdlg('Do you want to reset the game?');
        if(strcmp(answer, 'Yes'))
            hanoi_pins = initialize_hanoi(n);
        end
    end
end
end

