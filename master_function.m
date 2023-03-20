function [all_output] = master_function(vicon_and_delsys_data)

vicon_data = excel_upload(vicon_and_delsys_data);

vicon_dimensions = size(vicon_data);
dimensions_string = strcat("The vicon data is"," ", num2str(vicon_dimensions(1)),"X",num2str(vicon_dimensions(2))," ","large.");
disp(dimensions_string);

%asks if user wants to analyze a specific marker. This prompt continues
%cycling if the user input is invalid.
invalid_prompt = true;
prompt = "Do you want to analyze a specific marker? Type y for yes or n for no: ";
txt_yes_or_no = input(prompt,'s');

while invalid_prompt

    if txt_yes_or_no == 'y' || 'n'
        if txt_yes_or_no == 'y'
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

cycle_again = true;

%if the user wants to analyze a specific marker, executes the following
%code. Cycle_again is true at first, but the entire loop will continue
%executing if the user wants to analyze another marker.

while cycle_again
    if boolean_yes
        
        %scrolls through list of markers and checks if user input matches any of
        %the items. User input must exactly match one of the items
        %(case-sensitive), or else the prompt is repeated. Once the marker is
        %identified, the index is stored in the variable 'marker.'
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
        
        %indicates if there are any gaps (NaN coordinates) in the data for a
        %specific marker.
        gaps_present = gaps_in_data(vicon_and_delsys_data,txt)
    
        %presents three graphs: coordinates, coordinates over time, and
        %elevation (z coordinate) over time.
        subplot(1,3,1);
            marker_graph(vicon_and_delsys_data,txt);
        subplot(1,3,2);
            fourd_graph(vicon_and_delsys_data,txt);
        subplot(1,3,3);
            elevation_graph(vicon_and_delsys_data,txt);
    
    end
    
   %Asks if user wants to analyze another marker. If yes, cycles again
   %through this loop.
   invalid_prompt = true;
   prompt = "Do you want to analyze another marker? Type y for yes or n for no: ";
   txt_yes_or_no = input(prompt,'s');

    while invalid_prompt
    
        if txt_yes_or_no == 'y' || 'n'
            if txt_yes_or_no == 'y'
                boolean_yes = true;
                invalid_prompt = false;
                cycle_again = true;
            else
                boolean_yes = false;
                invalid_prompt = false;
                cycle_again = false;
            end
        else
            prompt = "Invalid prompt. Do you want to analyze a specific marker? Type y for yes or n for no: ";
            txt_yes_or_no = input(prompt,'s');
        end
            
    end
end

%asks if the user wants to quantify the total number of steps in the trial.
invalid_prompt = true;
prompt = "Do you want to quantify the total number of steps? Type y for yes or n for no: ";
txt_yes_or_no = input(prompt,'s');

%continues cycling through the prompt if the user input is invalid.
while invalid_prompt

    if txt_yes_or_no == 'y' || 'n'
        if txt_yes_or_no == 'y'
            boolean_yes = true;
            invalid_prompt = false;
        else
            boolean_yes = false;
            invalid_prompt = false;
        end
    else
        prompt = "Invalid prompt. Do you want to quantify the total number of steps? Type y for yes or n for no: ";
        txt_yes_or_no = input(prompt,'s');
    end
        
end

%quantifies the number of steps in the trial.
if boolean_yes
    quantify_steps(vicon_and_delsys_data);
end

end