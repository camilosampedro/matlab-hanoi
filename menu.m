function menu( hanoi_pins )
%MENU Menu
%   Repeat movements while the user has not won
while (~have_won(hanoi_pins))
    hanoi_pins = user_move_disk(hanoi_pins);
end
end

