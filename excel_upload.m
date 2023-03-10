function vicon_matrix = excel_upload(vicon_and_delsys_data)

vicon_and_delsys_matrix = readmatrix(vicon_and_delsys_data);

%finds point in matrix between vicon and delsys data sets
%the point where one index == 100, and the next in that row is NaN
%specifically appears right before the vicon data. This point becomes the
%reference point.
size_data_sheet = size(vicon_and_delsys_matrix);

for row = 1:size_data_sheet(1)
    for col = 1:size_data_sheet(2)
        if vicon_and_delsys_matrix(row,col) == 100 && isnan(vicon_and_delsys_matrix(row,col+1))
            ref_point = row;
            break
        end
    end
end

vicon_matrix = vicon_and_delsys_matrix((ref_point+4):end, 3:end); %vicon corresponds to coordinate (xyz) data
end