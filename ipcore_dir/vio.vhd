-------------------------------------------------------------------------------
-- Copyright (c) 2022 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.7
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : vio.vhd
-- /___/   /\     Timestamp  : Sun Jul 24 11:40:47 Iran Daylight Time 2022
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY vio IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    SYNC_IN: in std_logic_vector(69 downto 0);
    SYNC_OUT: out std_logic_vector(199 downto 0));
END vio;

ARCHITECTURE vio_a OF vio IS
BEGIN

END vio_a;
