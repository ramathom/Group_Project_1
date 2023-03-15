function [all_output] = master_function(vicon_and_delsys_data)

vicon_data = excel_upload(vicon_and_delsys_data);

vicon_dimensions = size(vicon_data);
dimensions_string = strcat("The vicon data is"," ", num2str(vicon_dimensions(1)),"X",num2str(vicon_dimensions(2))," ","large.");
disp(dimensions_string);

invalid_prompt = true;
prompt = "Do you want to analyze a specific marker? Type y for yes or n for no: ";
txt_yes_or_no = input(prompt,'s');

while invalid_prompt

    if txt_yes_or_no == "y" || "n"
        if txt_yes_or_no == "y"
            boolean_yes = true;
            invalid_prompt = false;
        else
            boolean_yes = false;
            invalid_prompt = false;
        end
    else
        prompt = "Invalid prompt. Do you want to analyze a specific marker? Type y for yes or n for no: ";
        txt_yes_or_no = input(prompt,'s');
    end
        
end

if boolean_yes
    [marker_matrix,marker_name] = extract_marker_of_interest(vicon_data);
    gaps_present = gaps_in_data(marker_matrix);
    
end