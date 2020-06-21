-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/18/2019 09:57:55"
                                                            
-- Vhdl Test Bench template for design  :  calculator
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY calculator_vhd_tst IS
END calculator_vhd_tst;
ARCHITECTURE calculator_arch OF calculator_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL col : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL displ1 : STD_LOGIC_VECTOR(0 TO 6);
SIGNAL display : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL displayTHREE : STD_LOGIC_VECTOR(0 TO 6);
SIGNAL displayTWO : STD_LOGIC_VECTOR(0 TO 6);
SIGNAL row : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
COMPONENT calculator
	PORT (
	clk : IN STD_LOGIC;
	col : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	displ1 : OUT STD_LOGIC_VECTOR(0 TO 6);
	display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	displayTHREE : OUT STD_LOGIC_VECTOR(0 TO 6);
	displayTWO : OUT STD_LOGIC_VECTOR(0 TO 6);
	row : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : calculator
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	col => col,
	displ1 => displ1,
	display => display,
	displayTHREE => displayTHREE,
	displayTWO => displayTWO,
	row => row,
	rst => rst
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END calculator_arch;
