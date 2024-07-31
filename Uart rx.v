module uart_rx(
input wire clk,
input wire rst,  
input wire rx_in,
input wire par_en,
input wire par_type,
output wire data_valid,
output wire [7:0] p_data
);

wire cnt_en;
wire [3:0] bit_cnt;
wire dat_samp_en;
wire [5:0] edge_cnt;
wire sampled_bit;
wire deser_en;
wire stp_err;
wire stp_chk_en;
wire strt_glitch;
wire strt_chk_en;
wire par_err;
wire par_chk_en;
wire p_data_ready;
wire done;



parity_check U1(
.par_type(par_type),
.par_chk_en(par_chk_en),
.parity_bit(sampled_bit),
.data_bits(p_data),
.parity_error(par_err)
);

data_sampling U2(
.edge_cnt(edge_cnt),
.dat_samp_en(dat_samp_en),
.rx_in(rx_in),
.sampled_bit(sampled_bit)
);

deser U3(
.sampled_bit(sampled_bit),
.deser_en(deser_en),
.clk(clk),
.rst(rst),
.bit_cnt(bit_cnt),
.edge_cnt(edge_cnt),
.p_data(p_data),
.p_data_ready(p_data_ready)
);

 edge_bit_cnt U4(
.cnt_en(cnt_en),
.clk(clk),
.bit_cnt(bit_cnt),
.edge_cnt(edge_cnt)
);

stop_check U5( 
.stop_bit(sampled_bit),
.stop_chk_en(stp_chk_en),
.stop_error(stp_err),
.done(done)
);

start_check U6(  
.start_bit(sampled_bit),
.start_chk_en(strt_chk_en),
.start_glitch(strt_glitch)
);

FSM U7(
.rx_in(rx_in),
.par_en(par_en),
.done(done),
.par_err(par_err),
.strt_glitch(strt_glitch),
.stp_err(stp_err),
.bit_cnt(bit_cnt),
.edge_cnt(edge_cnt),
.clk(clk),
.rst(rst),
.p_data_ready(p_data_ready),
.par_chk_en(par_chk_en),
.strt_chk_en(strt_chk_en),
.stp_chk_en(stp_chk_en),
.data_valid(data_valid),
.cnt_en(cnt_en),
.dat_samp_en(dat_samp_en),

.deser_en(deser_en)
);
endmodule
