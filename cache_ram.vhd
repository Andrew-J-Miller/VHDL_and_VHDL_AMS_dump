--cache_ram.vhd
-- Generated at Wed Aug 15 13:10:59 2018
--Andrew Miller 8/15/18
--cache_ram.vhd is a VHDL ram implementation for a cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cache_ram is

  port(reset_n, clk, read, write : in std_logic;
       addr : in std_logic_vector(9 downto 0);
       wrdata : in std_logic_vector(31 downto 0);
       rddata : out std_logic_vector(31 downto 0);
       hit : out std_logic
       );
       
  
end entity cache_ram;

architecture default of cache_ram is

  component cache is 
    port(clk, wren, reset_n : in std_logic;
         full_address : in std_logic_vector(9 downto 0);
         wrdata : in std_logic_vector(31 downto 0);
         validate : in std_logic;
         invalidate : in std_logic;
         data : out std_logic_vector(31 downto 0);
         hit : out std_logic;
         cache_ready : out std_logic := '1'
         );
  end component;
  
  component ram2 is
    port(clk, wr : in std_logic;
         address : in std_logic_vector(9 downto 0);
         data_in : in std_logic_vector(31 downto 0);
         data_out : out std_logic_vector(31 downto 0);
         ram_ready : out std_logic := '0'
         );
  end component;
  
  component controller is 
    port(write : in std_logic;
         read : in std_logic;
         hit : in std_logic;
         clk : in std_logic;
         cache_ready : in std_logic := '0';
         ram_ready : in std_logic := '0';
         wr_cache : out std_logic := '0';
         wr_ram : out std_logic := '0';
         invalidate : out std_logic := '0';
         validate : out std_logic := '1'
         );
         
  end component;
  
  signal wr_cache : std_logic;
  signal wr_ram : std_logic;
  signal invalidate : std_logic;
  signal validate : std_logic;
  signal wren : std_logic := '0';
  signal hit_out : std_logic;
  signal cache_ready : std_logic := '1';
  signal ram_out : std_logic_vector(31 downto 0);
  signal ram_ready : std_logic;
  signal cache_out : std_logic_vector(31 downto 0);
  signal which : std_logic;


  
begin

  cache_instance : cache
    port map(
             clk => clk,
             wren => wr_cache,
             reset_n => reset_n,
             full_address => addr,
             wrdata => ram_out,
             validate => validate,
             invalidate => invalidate,
             data => cache_out, 
             hit => hit_out,
             cache_ready => cache_ready
             );
             
  ram_instance : ram2
    port map(clk => clk,
             wr => wr_ram,
             address => addr,
             data_in => wrdata,
             data_out => ram_out,
             ram_ready => ram_ready
             );
             
  controller_instance : controller
    port map(write => write,
             read => read,
             hit => hit_out,
             clk => clk,
             cache_ready => cache_ready, 
             ram_ready => ram_ready,
             wr_cache => wr_cache,
             wr_ram => wr_ram,
             invalidate => invalidate,
             validate => validate
             );
             

  which <= read;
  hit <= hit_out;
  rddata <= ram_out when write = '1' else
            cache_out when read = '1' else
            cache_out;



  
end architecture default;

