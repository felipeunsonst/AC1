//FELIPE COSTA UNSONST 854155
module Da_minterms(
    input Db, Da, x,
    output Da_next
);
    assign Da_next = (~Db & Da & ~x) | (Db & ~Da & x) | (Db & Da);
endmodule

    
