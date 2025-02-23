//Felipe Costa Unsonst
//854155
module Guia_0301; 

  reg [7:0] a = 8'b000_1010; 
  reg [6:0] b = 7'b000_101; 
  reg [5:0] c = 6'b001_01; 
  reg [7:0] d = 0; 
  reg [6:0] e = 0; 
  reg [5:0] f = 0; 


  initial begin
    $display("Guia_0301 - Tests"); 
    
    d = ~a + 1; 
    $display("a = %8b -> C1(a) = %8b -> C2(a) = %8b", a, ~a, d); 
    
    e = ~b + 1; 
    $display("b = %7b -> C1(b) = %7b -> C2(b) = %7b", b, ~b, e); 
    
    f = ~c + 1; 
    $display("c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, f); 
  end 
endmodule 
