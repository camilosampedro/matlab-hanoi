function [ hanoi_pins ] = initialize_hanoi( number_of_disks )
%INITIALIZE_HANOI Initialize hanoi pins with the number of disks
%   hanoi pins will be a matrix of size n x 3
hanoi_pins = zeros(number_of_disks, 3);
% Change every number for the maximum integer.
% This is to check the minimum disk on the towers, without
% conflicts with the zeros.
hanoi_pins(1:end, 1:end) = 1000;
% The left tower will be filled with 1 to number of disks
hanoi_pins(:, 1) = 1:number_of_disks;
end

