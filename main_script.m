n = input('Enter the number of disks ( n >= 3 ): ');
hanoi_pins = zeros(3, n);
hanoi_pins(:, 1) = n:1;