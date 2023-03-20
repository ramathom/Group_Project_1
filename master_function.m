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
    prompt = "Which marker do you want to analyze? ";
    txt = input(prompt,'s');
    invalid_prompt = true;
    list_of_markers = ["LFHD","RFHD","LBDH","RBHD","C7","T10","CLAV","STRN","RBAK","LSHO","LUPA","LELB","LFRM","LWRA","LWRB","LFIN","RSHO","RUPA","RELB","RFRM","RWRA","RWRB","RFIN","LASI","RASI","LPSI","RPSI","LTHI","LKNE","LTIB","LANK","LHEE","LTOE","RTHI","RKNE","RTIB","RANK","RHEE","RTOE"];
    if ismember(txt,list_of_markers)
        invalid_prompt = false;
        marker = find(list_of_markers == txt);
    else
        prompt = "Invalid input. Which marker do you want to analyze? ";
        txt = input(prompt,'s');
    end
    
    gaps_present = gaps_in_data(vicon_and_delsys_data,txt)
    subplot(1,3,1);
        marker_graph(vicon_and_delsys_data,txt);
    subplot(1,3,2);
        fourd_graph(vicon_and_delsys_data,txt);
    subplot(1,3,3);
        elevation_graph(vicon_and_delsys_data,txt);


end
end