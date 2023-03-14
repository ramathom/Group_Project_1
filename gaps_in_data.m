function data_matrix = gaps_in_data(vicon_and_delsys_data)

list_of_markers = ["LFHD","RFHD","LBDH","RBHD","C7","T10","CLAV","STRN","RBAK","LSHO","LUPA","LELB","LFRM","LWRA","LWRB","LFIN","RSHO","RUPA","RELB","RFRM","RWRA","RWRB","RFIN","LASI","RASI","LPSI","RPSI","LTHI","LKNE","LTIB","LANK","LHEE","LTOE","RTHI","RKNE","RTIB","RANK","RHEE","RTOE"];
data_matrix = [];
gaps = '';
num_of_gaps = 0;
col_number = 1;

for count = 1:length(list_of_markers)
    time_window_of_marker = extract_time_windows(list_of_markers(count));
    if length(time_window_of_marker) >= 1
        data_matrix(1,col_number) = list_of_markers(count);

        for n = 1:length(time_window_of_marker)-1
            if time_window_of_marker(n) + 1 ~= time_window_of_marker(n+1)
                num_of_gaps = num_of_gaps + 1;
            end
        end
        data_matrix(2,col_number) = num_of_gaps;
        col_number = col_number + 1;
    end
end

end