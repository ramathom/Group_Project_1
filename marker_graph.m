function Three_dimensional_plot = marker_graph(vicon_and_delsys_data) 
%the input should be the specific marker outputted from the marker of interest function
  marker_of_interest = extract_marker_of_interest(vicon_and_delsys_data); 
  time_windows = extract_time_windows(marker_of_interest);
  %if columns are incomplete, call the time windows in marker of interest
 
  X= marker_of_interest(:,1);%select first column 
  Y= marker_of_interest(:,2);%second column 
  Z= marker_of_interest(:,3);%third column 
 
  three_dimensional_plot=plot3(X,Y,Z, '*') 
  xlabel('X Data (mm)')
  ylabel('Y Data (mm)')
  zlabel('Z Data (mm)')
  title('Vicon System: 3D Visualization of Marker') 
  %would be nice to make this title specific to whichever marker is being
  %called... find txt of marker and create string in title? 
  
end

