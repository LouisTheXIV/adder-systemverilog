// Test Bench for the adder
// also creates an adder.vcd file which can be viewed with gtkwave

module adder_tb();

    logic a, b, c;
    logic sum ,carry;

    adder dut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry)
    );

    integer i;

    initial begin 
        $dumpfile("adder.vcd");
        $dumpvars(0, adder_tb);

        for (i=0; i < 8; i = i + 1) begin
            {a, b, c} = i;
            #10;

            if (sum !== (a ^ b ^ c) || carry !== ((a & b) | (c & (a ^ b)))) begin
                $display("FAIL: a=%b b=%b c=%b sum=%b carry=%b",
                         a, b, c, sum, carry);
                $fatal;
            end

            $display("PASS: a=%b b=%b c=%b sum=%b carry=%b",
                     a, b, c, sum, carry);
        end

    end

endmodule
