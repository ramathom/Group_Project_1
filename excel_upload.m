function vicon_matrix = excel_upload(vicon_and_delsys_data)

vicon_and_delsys_matrix = readmatrix(vicon_and_delsys_data);

ref_point = (vicon_and_delsys_matrix == 100); %finds point in matrix between vicon and delsys data sets

vicon_matrix = vicon_and_delsys_matrix((ref_point+4):end, 3:67); %vicon corresponds to coordinate (xyz) data
end