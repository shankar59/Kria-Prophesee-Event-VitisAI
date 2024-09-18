-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity histoframe_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    out_mat_data2_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    out_mat_data2_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    out_mat_data2_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    out_mat_data2_empty_n : IN STD_LOGIC;
    out_mat_data2_read : OUT STD_LOGIC;
    ldata1_din : OUT STD_LOGIC_VECTOR (127 downto 0);
    ldata1_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_full_n : IN STD_LOGIC;
    ldata1_write : OUT STD_LOGIC;
    bound : IN STD_LOGIC_VECTOR (31 downto 0);
    strideBased_cols_bound_per_npc_V : IN STD_LOGIC_VECTOR (15 downto 0);
    op2_assign : IN STD_LOGIC_VECTOR (31 downto 0);
    last_blk_width_load : IN STD_LOGIC_VECTOR (3 downto 0);
    cols_bound_per_npc_load : IN STD_LOGIC_VECTOR (31 downto 0);
    localbuffer_V_3_out : OUT STD_LOGIC_VECTOR (127 downto 0);
    localbuffer_V_3_out_ap_vld : OUT STD_LOGIC;
    filled_V_1_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    filled_V_1_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of histoframe_accel_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv24_0 : STD_LOGIC_VECTOR (23 downto 0) := "000000000000000000000000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv128_lc_1 : STD_LOGIC_VECTOR (127 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv8_80 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv9_80 : STD_LOGIC_VECTOR (8 downto 0) := "010000000";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal icmp_ln1027_reg_457 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1027_reg_457_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1027_2_reg_472 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op45_read_state4 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal icmp_ln1027_reg_457_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1027_3_reg_486 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op66_write_state5 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln1027_fu_202_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal out_mat_data2_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ldata1_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal select_ln1247_fu_221_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal select_ln1247_reg_461 : STD_LOGIC_VECTOR (15 downto 0);
    signal bLast_fu_237_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bLast_reg_467 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1027_2_fu_242_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal filled_V_3_reg_476 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln1027_3_fu_282_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ret_V_1_fu_292_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_1_reg_490 : STD_LOGIC_VECTOR (8 downto 0);
    signal trunc_ln938_fu_298_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln938_reg_496 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_condition_exit_pp0_iter3_stage0 : STD_LOGIC;
    signal ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal or_ln_fu_302_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1266_fu_271_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter0_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter1_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter2_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter3_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_phi_reg_pp0_iter4_val_V_1_reg_168 : STD_LOGIC_VECTOR (23 downto 0);
    signal filled_V_fu_86 : STD_LOGIC_VECTOR (7 downto 0);
    signal filled_next_fu_311_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal localbuffer_V_fu_90 : STD_LOGIC_VECTOR (127 downto 0);
    signal localbuffer_V_3_fu_380_p3 : STD_LOGIC_VECTOR (127 downto 0);
    signal ret_V_fu_338_p2 : STD_LOGIC_VECTOR (127 downto 0);
    signal j_V_fu_94 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln840_fu_247_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_sig_allocacmp_j_V_load : STD_LOGIC_VECTOR (15 downto 0);
    signal indvar_flatten_fu_98 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln1027_fu_207_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal icmp_ln1027_1_fu_216_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln1027_fu_234_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal xf_bits_per_clock_fu_261_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal sext_ln1266_fu_267_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal sub_ln1277_fu_276_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1496_fu_288_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln1267_fu_325_p1 : STD_LOGIC_VECTOR (127 downto 0);
    signal zext_ln930_fu_329_p1 : STD_LOGIC_VECTOR (127 downto 0);
    signal r_V_3_fu_332_p2 : STD_LOGIC_VECTOR (127 downto 0);
    signal sub_ln553_fu_355_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln930_1_fu_360_p1 : STD_LOGIC_VECTOR (127 downto 0);
    signal trunc_ln455_fu_352_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln948_fu_370_p1 : STD_LOGIC_VECTOR (127 downto 0);
    signal p_Result_s_fu_345_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_V_fu_364_p2 : STD_LOGIC_VECTOR (127 downto 0);
    signal r_V_2_fu_374_p2 : STD_LOGIC_VECTOR (127 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_411 : BOOLEAN;
    signal ap_condition_414 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component histoframe_accel_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component histoframe_accel_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter3_reg = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter3_stage0)) then 
                    ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_phi_reg_pp0_iter3_val_V_1_reg_168_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                if (((icmp_ln1027_reg_457 = ap_const_lv1_0) and (icmp_ln1027_2_fu_242_p2 = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter3_val_V_1_reg_168 <= ap_const_lv24_0;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter3_val_V_1_reg_168 <= ap_phi_reg_pp0_iter2_val_V_1_reg_168;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter4_val_V_1_reg_168_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then
                if (((icmp_ln1027_2_reg_472 = ap_const_lv1_1) and (icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter4_val_V_1_reg_168 <= out_mat_data2_dout;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter4_val_V_1_reg_168 <= ap_phi_reg_pp0_iter3_val_V_1_reg_168;
                end if;
            end if; 
        end if;
    end process;

    filled_V_fu_86_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    filled_V_fu_86 <= ap_const_lv8_0;
                elsif (((icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
                    filled_V_fu_86 <= filled_next_fu_311_p2;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten_fu_98_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_98 <= ap_const_lv32_0;
                elsif (((icmp_ln1027_fu_202_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    indvar_flatten_fu_98 <= add_ln1027_fu_207_p2;
                end if;
            end if; 
        end if;
    end process;

    j_V_fu_94_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    j_V_fu_94 <= ap_const_lv16_0;
                elsif (((icmp_ln1027_reg_457 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
                    j_V_fu_94 <= add_ln840_fu_247_p2;
                end if;
            end if; 
        end if;
    end process;

    localbuffer_V_fu_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    localbuffer_V_fu_90 <= ap_const_lv128_lc_1;
                elsif ((ap_const_boolean_1 = ap_condition_414)) then 
                    localbuffer_V_fu_90 <= ret_V_fu_338_p2;
                elsif ((ap_const_boolean_1 = ap_condition_411)) then 
                    localbuffer_V_fu_90 <= localbuffer_V_3_fu_380_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
                icmp_ln1027_reg_457 <= icmp_ln1027_fu_202_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                icmp_ln1027_reg_457_pp0_iter2_reg <= icmp_ln1027_reg_457;
                icmp_ln1027_reg_457_pp0_iter3_reg <= icmp_ln1027_reg_457_pp0_iter2_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter1_val_V_1_reg_168 <= ap_phi_reg_pp0_iter0_val_V_1_reg_168;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter2_val_V_1_reg_168 <= ap_phi_reg_pp0_iter1_val_V_1_reg_168;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1027_reg_457 = ap_const_lv1_0))) then
                bLast_reg_467 <= bLast_fu_237_p2;
                icmp_ln1027_2_reg_472 <= icmp_ln1027_2_fu_242_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then
                filled_V_3_reg_476 <= filled_V_fu_86;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_0))) then
                icmp_ln1027_3_reg_486 <= icmp_ln1027_3_fu_282_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_0) and (icmp_ln1027_3_fu_282_p2 = ap_const_lv1_0))) then
                ret_V_1_reg_490 <= ret_V_1_fu_292_p2;
                trunc_ln938_reg_496 <= trunc_ln938_fu_298_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln1027_fu_202_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                select_ln1247_reg_461 <= select_ln1247_fu_221_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln1027_fu_207_p2 <= std_logic_vector(unsigned(indvar_flatten_fu_98) + unsigned(ap_const_lv32_1));
    add_ln840_fu_247_p2 <= std_logic_vector(unsigned(select_ln1247_reg_461) + unsigned(ap_const_lv16_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, out_mat_data2_empty_n, ap_predicate_op45_read_state4, ldata1_full_n, ap_predicate_op66_write_state5)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_predicate_op66_write_state5 = ap_const_boolean_1) and (ldata1_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1)) or ((ap_predicate_op45_read_state4 = ap_const_boolean_1) and (out_mat_data2_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, out_mat_data2_empty_n, ap_predicate_op45_read_state4, ldata1_full_n, ap_predicate_op66_write_state5)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_predicate_op66_write_state5 = ap_const_boolean_1) and (ldata1_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1)) or ((ap_predicate_op45_read_state4 = ap_const_boolean_1) and (out_mat_data2_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, out_mat_data2_empty_n, ap_predicate_op45_read_state4, ldata1_full_n, ap_predicate_op66_write_state5)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_predicate_op66_write_state5 = ap_const_boolean_1) and (ldata1_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1)) or ((ap_predicate_op45_read_state4 = ap_const_boolean_1) and (out_mat_data2_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter3_assign_proc : process(out_mat_data2_empty_n, ap_predicate_op45_read_state4)
    begin
                ap_block_state4_pp0_stage0_iter3 <= ((ap_predicate_op45_read_state4 = ap_const_boolean_1) and (out_mat_data2_empty_n = ap_const_logic_0));
    end process;


    ap_block_state5_pp0_stage0_iter4_assign_proc : process(ldata1_full_n, ap_predicate_op66_write_state5)
    begin
                ap_block_state5_pp0_stage0_iter4 <= ((ap_predicate_op66_write_state5 = ap_const_boolean_1) and (ldata1_full_n = ap_const_logic_0));
    end process;


    ap_condition_411_assign_proc : process(ap_enable_reg_pp0_iter4, icmp_ln1027_reg_457_pp0_iter3_reg, icmp_ln1027_3_reg_486)
    begin
                ap_condition_411 <= ((icmp_ln1027_3_reg_486 = ap_const_lv1_0) and (icmp_ln1027_reg_457_pp0_iter3_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1));
    end process;


    ap_condition_414_assign_proc : process(ap_enable_reg_pp0_iter4, icmp_ln1027_reg_457_pp0_iter3_reg, icmp_ln1027_3_reg_486)
    begin
                ap_condition_414 <= ((icmp_ln1027_3_reg_486 = ap_const_lv1_1) and (icmp_ln1027_reg_457_pp0_iter3_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1));
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln1027_fu_202_p2)
    begin
        if (((icmp_ln1027_fu_202_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_condition_exit_pp0_iter3_stage0_assign_proc : process(ap_enable_reg_pp0_iter3, icmp_ln1027_reg_457_pp0_iter2_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            ap_condition_exit_pp0_iter3_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter3_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter3_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter3_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4)
    begin
        if (((ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4_assign_proc : process(icmp_ln1027_reg_457_pp0_iter2_reg, icmp_ln1027_3_fu_282_p2, or_ln_fu_302_p3, ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159, zext_ln1266_fu_271_p1)
    begin
        if ((icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_0)) then
            if ((icmp_ln1027_3_fu_282_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 <= zext_ln1266_fu_271_p1;
            elsif ((icmp_ln1027_3_fu_282_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 <= or_ln_fu_302_p3;
            else 
                ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 <= ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159;
            end if;
        else 
            ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4 <= ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_val_V_1_reg_168 <= "XXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter3_conv3_i12_i_i923_pn_reg_159 <= "XXXXXXXX";

    ap_predicate_op45_read_state4_assign_proc : process(icmp_ln1027_reg_457_pp0_iter2_reg, icmp_ln1027_2_reg_472)
    begin
                ap_predicate_op45_read_state4 <= ((icmp_ln1027_2_reg_472 = ap_const_lv1_1) and (icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_0));
    end process;


    ap_predicate_op66_write_state5_assign_proc : process(icmp_ln1027_reg_457_pp0_iter3_reg, icmp_ln1027_3_reg_486)
    begin
                ap_predicate_op66_write_state5 <= ((icmp_ln1027_3_reg_486 = ap_const_lv1_0) and (icmp_ln1027_reg_457_pp0_iter3_reg = ap_const_lv1_0));
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_j_V_load_assign_proc : process(ap_enable_reg_pp0_iter2, icmp_ln1027_reg_457, ap_block_pp0_stage0, j_V_fu_94, add_ln840_fu_247_p2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln1027_reg_457 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            ap_sig_allocacmp_j_V_load <= add_ln840_fu_247_p2;
        else 
            ap_sig_allocacmp_j_V_load <= j_V_fu_94;
        end if; 
    end process;

    bLast_fu_237_p2 <= "1" when (op2_assign = zext_ln1027_fu_234_p1) else "0";
    filled_V_1_out <= filled_V_fu_86;

    filled_V_1_out_ap_vld_assign_proc : process(icmp_ln1027_reg_457_pp0_iter2_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_1))) then 
            filled_V_1_out_ap_vld <= ap_const_logic_1;
        else 
            filled_V_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    filled_next_fu_311_p2 <= std_logic_vector(unsigned(ap_phi_mux_conv3_i12_i_i923_pn_phi_fu_162_p4) + unsigned(filled_V_fu_86));
    icmp_ln1027_1_fu_216_p2 <= "1" when (ap_sig_allocacmp_j_V_load = strideBased_cols_bound_per_npc_V) else "0";
    icmp_ln1027_2_fu_242_p2 <= "1" when (signed(zext_ln1027_fu_234_p1) < signed(cols_bound_per_npc_load)) else "0";
    icmp_ln1027_3_fu_282_p2 <= "1" when (unsigned(sub_ln1277_fu_276_p2) > unsigned(filled_V_fu_86)) else "0";
    icmp_ln1027_fu_202_p2 <= "1" when (indvar_flatten_fu_98 = bound) else "0";

    ldata1_blk_n_assign_proc : process(ap_enable_reg_pp0_iter4, ldata1_full_n, ap_predicate_op66_write_state5, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op66_write_state5 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            ldata1_blk_n <= ldata1_full_n;
        else 
            ldata1_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    ldata1_din <= (r_V_3_fu_332_p2 or localbuffer_V_fu_90);

    ldata1_write_assign_proc : process(ap_enable_reg_pp0_iter4, ap_predicate_op66_write_state5, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op66_write_state5 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            ldata1_write <= ap_const_logic_1;
        else 
            ldata1_write <= ap_const_logic_0;
        end if; 
    end process;

    localbuffer_V_3_fu_380_p3 <= 
        r_V_fu_364_p2 when (p_Result_s_fu_345_p3(0) = '1') else 
        r_V_2_fu_374_p2;
    localbuffer_V_3_out <= localbuffer_V_fu_90;

    localbuffer_V_3_out_ap_vld_assign_proc : process(icmp_ln1027_reg_457_pp0_iter2_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln1027_reg_457_pp0_iter2_reg = ap_const_lv1_1))) then 
            localbuffer_V_3_out_ap_vld <= ap_const_logic_1;
        else 
            localbuffer_V_3_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    or_ln_fu_302_p3 <= (ap_const_lv3_4 & sext_ln1266_fu_267_p1);

    out_mat_data2_blk_n_assign_proc : process(ap_enable_reg_pp0_iter3, out_mat_data2_empty_n, ap_predicate_op45_read_state4, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op45_read_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            out_mat_data2_blk_n <= out_mat_data2_empty_n;
        else 
            out_mat_data2_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    out_mat_data2_read_assign_proc : process(ap_enable_reg_pp0_iter3, ap_predicate_op45_read_state4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op45_read_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            out_mat_data2_read <= ap_const_logic_1;
        else 
            out_mat_data2_read <= ap_const_logic_0;
        end if; 
    end process;

    p_Result_s_fu_345_p3 <= ret_V_1_reg_490(8 downto 8);
    r_V_2_fu_374_p2 <= std_logic_vector(shift_right(unsigned(zext_ln1267_fu_325_p1),to_integer(unsigned('0' & zext_ln948_fu_370_p1(31-1 downto 0)))));
    r_V_3_fu_332_p2 <= std_logic_vector(shift_left(unsigned(zext_ln1267_fu_325_p1),to_integer(unsigned('0' & zext_ln930_fu_329_p1(31-1 downto 0)))));
    r_V_fu_364_p2 <= std_logic_vector(shift_left(unsigned(zext_ln1267_fu_325_p1),to_integer(unsigned('0' & zext_ln930_1_fu_360_p1(31-1 downto 0)))));
    ret_V_1_fu_292_p2 <= std_logic_vector(unsigned(ap_const_lv9_80) - unsigned(zext_ln1496_fu_288_p1));
    ret_V_fu_338_p2 <= (r_V_3_fu_332_p2 or localbuffer_V_fu_90);
    select_ln1247_fu_221_p3 <= 
        ap_const_lv16_0 when (icmp_ln1027_1_fu_216_p2(0) = '1') else 
        ap_sig_allocacmp_j_V_load;
        sext_ln1266_fu_267_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(xf_bits_per_clock_fu_261_p3),5));

    sub_ln1277_fu_276_p2 <= std_logic_vector(signed(ap_const_lv8_80) - signed(zext_ln1266_fu_271_p1));
    sub_ln553_fu_355_p2 <= std_logic_vector(unsigned(ap_const_lv7_0) - unsigned(trunc_ln938_reg_496));
    trunc_ln455_fu_352_p1 <= ret_V_1_reg_490(8 - 1 downto 0);
    trunc_ln938_fu_298_p1 <= ret_V_1_fu_292_p2(7 - 1 downto 0);
    xf_bits_per_clock_fu_261_p3 <= 
        last_blk_width_load when (bLast_reg_467(0) = '1') else 
        ap_const_lv4_8;
    zext_ln1027_fu_234_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln1247_reg_461),32));
    zext_ln1266_fu_271_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln1266_fu_267_p1),8));
    zext_ln1267_fu_325_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_reg_pp0_iter4_val_V_1_reg_168),128));
    zext_ln1496_fu_288_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(filled_V_fu_86),9));
    zext_ln930_1_fu_360_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln553_fu_355_p2),128));
    zext_ln930_fu_329_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(filled_V_3_reg_476),128));
    zext_ln948_fu_370_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln455_fu_352_p1),128));
end behav;
