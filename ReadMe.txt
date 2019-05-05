For compiling with process(all) make the following changes to your .qsf file :

1.Find the file in which the aforementioned process statement is used
	eg: one of the line in the qsf will be like - 
		set_global_assignment -name VHDL_FILE <file_name>.vhd 

2.change the statement to 
		set_global_assignment -name VHDL_FILE <file_name>.vhd -hdl_version VHDL_2008

	where <file_name> is the name of the files in which process(all) is used