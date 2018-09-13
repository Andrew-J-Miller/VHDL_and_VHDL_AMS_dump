--cache.vhd
-- Generated at Wed Aug 15 13:43:54 2018
--Andrew Miller 8/15/18
--cache.vhd is a vhdl implementation of a 2 way set associative 4 kb cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity data_cache is

  port(clk, wren, reset_n : in std_logic;
       full_address : in std_logic_vector(9 downto 0);
       wrdata : in std_logic_vector(31 downto 0);
       validate : in std_logic;
       invalidate : in std_logic;
       data : out std_logic_vector(31 downto 0);
       hit : out std_logic;
       cache_ready : out std_logic := '1'
       );
       
  
end entity data_cache;

architecture default of data_cache is

  component data_array is
    port(clk, wren : in std_logic;
         address : in std_logic_vector(5 downto 0);
         wrdata : in std_logic_vector(31 downto 0);
         data : out std_logic_vector(31 downto 0)
         );
         
  end component;
  
  component tag_valid_array is
    port(clk, wren, reset_n, validate, invalidate : in std_logic;
         address : in std_logic_vector(5 downto 0);
         wrdata : in std_logic_vector(3 downto 0);
         output : out std_logic_vector(4 downto 0)
         );
         
  end component;
  
  component lru_array is
    port(address : in std_logic_vector(5 downto 0);
         k : in std_logic;
         clk : in std_logic;
         enable : in std_logic;
         reset : in std_logic;
         w0_valid : out std_logic
         );
         
  end component;
  
  component miss_hit_logic is
    port(tag : in std_logic_vector(3 downto 0);
         w0 : in std_logic_vector(4 downto 0);
         w1 : in std_logic_vector(4 downto 0);
         hit : out std_logic;
         w0_valid : out std_logic;
         w1_valid : out std_logic
         );
         
  end component;
  
  component mux2_32bit
    port(in0, in1 : in std_logic_vector(31 downto 0);
         output : out std_logic_vector(31 downto 0);
         sel : in std_logic
         );
  end component;
  
 
 type data_array_type is array (63 downto 0) of std_logic_vector(31 downto 0);
 signal k0_data : std_logic_vector(31 downto 0);
 signal k1_data : std_logic_vector(31 downto 0);
 signal k0_tag_valid_out : std_logic_vector(4 downto 0);
 signal k1_tag_valid_out : std_logic_vector(4 downto 0);
 signal k0_wren : std_logic := '0';
 signal k1_wren : std_logic := '0';
 signal enable : std_logic := '1';
 signal k : std_logic;
 signal hit_readable : std_logic;
 signal w0_valid, w1_valid : std_logic;
 signal w0_valid_lru : std_logic;
 
 type states is (flush, idle, tagCompare, WriteBack, MemRead, UpdateDc);
  
begin

  --instantiation of both data arrays
  --2 arrays b/c 2 way set associative

  k0_data_array : data_array
    port map(clk => clk,
             wren => k0_wren,
             address => full_address(5 downto 0),
             wrdata => wrdata,
             data => k0_data
             );
  
  k1_data_array : data_array
    port map(clk => clk,
             wren => k1_wren,
             address => full_address(5 downto 0),
             wrdata => wrdata,
             data => k1_data
             );
            
  --tag valid instantiation
  k0_tag_valid : tag_valid_array
    port map(clk => clk,
             wren => k0_wren,
             reset_n => reset_n,
             validate => validate,
             invalidate => invalidate,
             address => full_address(5 downto 0),
             wrdata => full_address(9 downto 6),
             output => k0_tag_valid_out
             );
             
  k1_tag_valid : tag_valid_array
    port map(clk => clk,
             wren => k1_wren,
             reset_n => reset_n,
             validate => validate,
             invalidate => invalidate,
             address => full_address(5 downto 0),
             wrdata => full_address(9 downto 6),
             output => k1_tag_valid_out
             );
             
  --Miss hit instantiation
  miss_hit : miss_hit_logic
    port map(tag => full_address(9 downto 6),
             w0 => k0_tag_valid_out,
             w1 => k1_tag_valid_out,
             hit => hit_readable,
             w0_valid => w0_valid,
             w1_valid => w1_valid
             );
             
  hit <= hit_readable;
  
  --LRU array instantiation
  lru_logic : lru_array
    port map(address => full_address(5 downto 0),
             k => k,
             clk => clk,
             reset => invalidate,
             w0_valid => w0_valid_lru,
             enable => enable
             );
             
  mux : mux2_32bit
    port map(in0 => k0_data,
             in1 => k1_data,
             output => data,
             sel => k
             );
             
  
  
      
  
end architecture default;

