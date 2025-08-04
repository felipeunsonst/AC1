//FELIPE COSTA UNSONST --854155

module recuperacao_01;

  // Entradas simuladas
  reg [3:0] a;
  reg [2:0] i;

  // ---------- Exercício 01 ----------

  // a) 
  wire f_sop;
  assign f_sop = (a == 4'd1)  || (a == 4'd3)  || (a == 4'd4) ||
                 (a == 4'd5)  || (a == 4'd7)  || (a == 4'd10) ||
                 (a == 4'd11) || (a == 4'd13) || (a == 4'd15);

  // b) 
  wire f_pos;
  assign f_pos = ~((a == 4'd0) || (a == 4'd2) || (a == 4'd6) ||
                   (a == 4'd8) || (a == 4'd9) || (a == 4'd12) || (a == 4'd14));

  // c) 
  reg A, B, C, D;
  wire f_simpl;
  assign f_simpl = (~B & D) | (~B & C) | (~A & C & ~D);

  // e) 
  wire t1, t2, t3, f_nand;

  assign t1 = ~(~((~B) & D));        
  assign t2 = ~(~((~B) & C));        
  assign t3 = ~(~((~A) & C & (~D))); 

  assign f_nand = ~(~t1 & ~t2 & ~t3); 

  // f) 
  wire n1, n2, n3, f_nor;
  assign n1 = ~((B) | (~D));          
  assign n2 = ~((B) | (~C));          
  assign n3 = ~((A) | (~C) | D);      
  assign f_nor = ~((~n1) | (~n2) | (~n3)); 

  // ---------- Exercício 04 ----------
  reg a4, b4, c4;
  wire f4_expr, f4_nand;

  assign f4_expr = ~((~a4) | (b4 & c4)); 

  wire nota4, and_bc4, and_bc_true4, or_expr4;
  assign nota4 = ~(a4 & a4);
  assign and_bc4 = ~(b4 & c4);
  assign and_bc_true4 = ~(and_bc4 & and_bc4);
  assign or_expr4 = ~(nota4 & nota4) & ~(and_bc_true4 & and_bc_true4);
  assign f4_nand = ~(or_expr4 & or_expr4);

  // ---------- Exercício 05 ----------
  // a) 
  reg [7:0] dec53 = 8'd53;
  wire [7:0] c2_8 = ~dec53 + 1;

  // b) 
  reg [7:0] h1 = 8'b11000110;
  reg [7:0] h2 = 8'b11101101;
  integer hamming, j;

  initial begin
    $display("\n--- Exercício 01 ---");
    $display(" a | f_sop f_pos");
    for (i = 0; i < 16; i = i + 1) begin
      a = i;
      #1 $display("%02d |   %b     %b", a, f_sop, f_pos);
    end

    $display("\nExpressão simplificada f = b'd + b'c + a'c'd");
    A = 0; B = 0; C = 0; D = 0;
    $display("\nA B C D | f_simpl f_nand f_nor");
    for (i = 0; i < 16; i = i + 1) begin
      {A, B, C, D} = i;
      #1 $display("%b %b %b %b |    %b      %b      %b", A, B, C, D, f_simpl, f_nand, f_nor);
    end

    // Exercício 04
    $display("\n--- Exercício 04 ---");
    $display("a b c | f_expr f_nand");
    for (i = 0; i < 8; i = i + 1) begin
      {a4, b4, c4} = i;
      #1 $display("%b %b %b |   %b      %b", a4, b4, c4, f4_expr, f4_nand);
    end

    // Exercício 05
    $display("\n--- Exercício 05 ---");
    $display("a) C2,8(53) = ~%b + 1 = %b", dec53, c2_8);

    hamming = 0;
    for (j = 0; j < 8; j = j + 1)
      hamming = hamming + (h1[j] ^ h2[j]);
    $display("b) Hamming(11000110, 11101101) = %0d", hamming);
  end

endmodule
