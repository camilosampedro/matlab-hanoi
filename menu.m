function menu( hanoi_pins )
%MENU Summary of this function goes here
%   Detailed explanation goes here
while (~have_won(hanoi_pins))
    hanoi_pins = user_move_disk(hanoi_pins);
end
end

