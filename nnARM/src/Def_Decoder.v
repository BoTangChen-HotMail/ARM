`define	Def_IsBX		(in_PipelineRegister_IFID[27:4]==24'b0001_0010_1111_1111_1111_0001)
`define	Def_IsSWI		(in_PipelineRegister_IFID[27:24]==4'b1111)
`define	Def_IsMultiple		(in_PipelineRegister_IFID[27:22]==6'b000000 && in_PipelineRegister_IFID[7:4]==4'b1001)
`define	Def_IsBranch		(in_PipelineRegister_IFID[27:25]==3'b101)
`define	Def_IsMRS		(in_PipelineRegister_IFID[27:23]==5'b00010 && in_PipelineRegister_IFID[21:16]==6'b001111 && in_PipelineRegister_IFID[11:0]==12'h000)
`define	Def_IsMSRReg		(in_PipelineRegister_IFID[27:23]==5'b00010 && in_PipelineRegister_IFID[21:4]==18'b101001111100000000)
`define	Def_IsMSRCondition	(in_PipelineRegister_IFID[27:26]==2'b00 && in_PipelineRegister_IFID[24:23]==2'b10 && in_PipelineRegister_IFID[21:12]==10'b1010001111)
`define Def_IsALUInstruction	(in_PipelineRegister_IFID[27:26]==2'b00 && (in_PipelineRegister_IFID[25]==1'b1 || (in_PipelineRegister_IFID[25]==1'b0 && ({in_PipelineRegister_IFID[7],in_PipelineRegister_IFID[4]}==2'b01) && in_PipelineRegister_IFID[11:8]!=4'b1111)))
`define Def_IsLoadInstruction	(in_PipelineRegister_IFID[27:26]==2'b01 && {in_PipelineRegister_IFID[25]==1'b0 || (in_PipelineRegister_IFID[25]==1'b1 && in_PipelineRegister_IFID[4]==1'b0)} && in_PipelineRegister_IFID[20]==1'b1)
`define Def_IsStoreInstruction	(in_PipelineRegister_IFID[27:26]==2'b01 && {in_PipelineRegister_IFID[25]==1'b0 || (in_PipelineRegister_IFID[25]==1'b1 && in_PipelineRegister_IFID[4]==1'b0)} && in_PipelineRegister_IFID[20]==1'b0)
`define	Def_IsSTM		(in_PipelineRegister_IFID[27:25]==3'b100 && in_PipelineRegister_IFID[20]==1'b0)
`define	Def_IsLDM		(in_PipelineRegister_IFID[27:25]==3'b100 && in_PipelineRegister_IFID[20]==1'b1)
`define	Def_IsMULL		({in_PipelineRegister_IFID[27:23],in_PipelineRegister_IFID[21],in_PipelineRegister_IFID[7:4]}==10'b000010_1001)

`define	Def_IsNoResultWritenInstruction		(in_PipelineRegister_IFID[24:21]==`ARMALU_TST || in_PipelineRegister_IFID[24:21]==`ARMALU_TEQ || in_PipelineRegister_IFID[24:21]==`ARMALU_CMP  || in_PipelineRegister_IFID[24:21]==`ARMALU_CMN)
`define	Def_PrevOperationWriteSourceOfCurrentOperationFromMEM	((PrevOperationWantWriteRegisterFromMEM==1'b1) && ( (PrevWriteRegister==out_LeftReadRegisterNumber && out_ALULeftFromImm==1'b0) || (PrevWriteRegister==out_RightReadRegisterNumber && out_ALURightFromImm==1'b0) || (PrevWriteRegister==out_ThirdReadRegisterNumber && out_ALUThirdFromImm==1'b0) )  )