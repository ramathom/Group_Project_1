function [all_output] = master_function(vicon_and_delsys_data)

vicon_data = excel_upload(vicon_and_delsys_data);

vicon_dimensions = size(vicon_data);
dimensions_string = strcat("This data is","", num2str(vicon_dimensions(1)),"X",num2str(vicon_dimensions(2))," ","large.");
disp(dimensions_string);


end