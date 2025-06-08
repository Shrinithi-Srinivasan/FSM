module fsm_tb;
  reg clk;
  reg a;
  wire out1, out2;
  fsm uut (
    .clk(clk),
    .a(a),
    .out1(out1),
    .out2(out2)
  );
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    a = 0;
    #10 a = 1;
    #10 a = 1;
    #10 a = 0;
    #10 a = 1;
    #10 a = 0;
    #10 a = 1;
    #10 a = 1;
    #10 a = 0;
    #10 a = 1;
    #10 a = 1;
    #10 $stop;
  end
  initial begin
    $monitor("Time: %0t | a: %b | state: %b | out1: %b | out2: %b", $time, a, uut.state, out1, out2);
  end
endmodule
