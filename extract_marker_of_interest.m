function [matrix_marker_of_interest,name_of_marker] = extract_marker_of_interest(vicon_and_delsys_data,txt)

complete_vicon_data = excel_upload(vicon_and_delsys_data);

%complete list of all markers.
list_of_markers = ["LFHD","RFHD","LBDH","RBHD","C7","T10","CLAV","STRN","RBAK","LSHO","LUPA","LELB","LFRM","LWRA","LWRB","LFIN","RSHO","RUPA","RELB","RFRM","RWRA","RWRB","RFIN","LASI","RASI","LPSI","RPSI","LTHI","LKNE","LTIB","LANK","LHEE","LTOE","RTHI","RKNE","RTIB","RANK","RHEE","RTOE"];

%asks user which marker to be analyzed.
%prompt = "Which marker do you want to analyze? ";
%txt = input(prompt,'s');
%invalid_prompt = true;

%scrolls through list of markers and checks if user input matches any of
%the items. User input must exactly match one of the items
%(case-sensitive), or else the prompt is repeated. Once the marker is
%identified, the index is stored in the variable 'marker.'
%while invalid_prompt

%    if ismember(txt,list_of_markers)
%        invalid_prompt = false;
        marker = find(list_of_markers == txt);
%    else
%        prompt = "Invalid input. Which marker do you want to analyze? ";
%        txt = input(prompt,'s');
%    end

%end

%identifies reference point (column) on the matrix of complete data, based on 'marker.'
ref_point_on_matrix = 3*(marker-1) + 1;

%creates a matrix consisting only of coordinate data of the marker of
%interest from the complete data.
matrix_marker_of_interest = complete_vicon_data(1:end,ref_point_on_matrix:(ref_point_on_matrix+2));

%outputs name of marker, too.
name_of_marker = list_of_markers(marker);

end