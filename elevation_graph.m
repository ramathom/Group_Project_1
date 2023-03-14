function two_dim_plot = elevation_graph(vicon_and_delsys_data)
    
    marker_of_interest = extract_marker_of_interest(vicon_and_delsys_data); 

    y = marker_of_interest(:,3); %is looking at elevation by looking at Z coordinates
    x = 1:size(y,1); %makes x just the time points by essentially taking all the indices of Z coordinates
    two_dim_plot = plot(x,y);
    xlabel('Time Points');
    ylabel('Elevation (mm)');
    title('Elevation by Time');

end