module adder(input a, b, c, output sum, carry);

    // sum = a xor b xor c
    // carry = (a and b) or (c and (a xor b))

    xor (axorb, a, b);
    xor (sum, axorb, c);
    and (aandb, a, b);
    and (candaxorb, c, axorb);
    or (carry, aandb, candaxorb);
    
endmodule
