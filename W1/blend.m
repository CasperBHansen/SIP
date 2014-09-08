function [ O ] = blend(A, B, w_A, w_B) 
    O = (A.*w_A) + (B.*w_B);
end