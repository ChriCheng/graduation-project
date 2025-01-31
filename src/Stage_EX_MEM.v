module EX_MEM(
	clk_i,
	start_i,
	pc_i,
	zero_i,
	ALUResult_i,
    VALUResult_i, //NEW
	RDData_i,
	RDaddr_i,
	RegWrite_i,
	MemToReg_i,
	MemRead_i,
	MemWrite_i,
    RS1_in,
    RS2_in,
    RD_in,
    RD_out,
    RS1_out,
    RS2_out,
	instr_i,
	instr_o,
	pc_o,
	zero_o,
	ALUResult_o,
    VALUResult_o, //NEW
	RDData_o,
	RDaddr_o,
	RegWrite_o,
	MemToReg_o,
	MemRead_o,
	MemWrite_o,
    Stall
);

input	clk_i, zero_i, RegWrite_i, MemToReg_i, MemRead_i, MemWrite_i, start_i,Stall;
input	[31:0]	pc_i, ALUResult_i, RDData_i, VALUResult_i; //NEW
input	[4:0] RS1_in,RS2_in,RD_in,RDaddr_i;
input 	[31:0] instr_i;
output reg [31:0] instr_o;
output	zero_o, RegWrite_o, MemToReg_o, MemRead_o, MemWrite_o;
output	[31:0]	pc_o, ALUResult_o, RDData_o, VALUResult_o; //NEW
output reg[4:0] RD_out,RDaddr_o,RS1_out,RS2_out;
reg	 zero_o, RegWrite_o, MemToReg_o, MemRead_o, MemWrite_o;
reg	[31:0]	pc_o, ALUResult_o, RDData_o, VALUResult_o;//NEW

always@(posedge clk_i or negedge start_i) begin
	if(~start_i) begin
		pc_o <= 0;
		zero_o <= 0;
		ALUResult_o <= 0;
        VALUResult_o <= 0; //NEW
		RDData_o <= 0;
		RDaddr_o <= 0;
		RegWrite_o <= 0;
		MemToReg_o <= 0;
		MemRead_o <= 0;
		MemWrite_o <= 0;
		instr_o	<= 0;
        RS1_out <= 0;
        RS2_out <= 0;
        RD_out <= 0;
	end
	else if(~Stall)begin
		pc_o <= pc_i;
		zero_o <= zero_i;
		ALUResult_o <= ALUResult_i;
        VALUResult_o <= VALUResult_i; //NEW
		RDData_o <= RDData_i;
		RDaddr_o <= RDaddr_i;
		RegWrite_o <= RegWrite_i;
		MemToReg_o <= MemToReg_i;
		MemRead_o <= MemRead_i;
		MemWrite_o <= MemWrite_i;
		instr_o    <= instr_i;
        RS1_out <= RS1_in;
        RS2_out <= RS2_in;
        RD_out <= RD_in;
	end
end

endmodule