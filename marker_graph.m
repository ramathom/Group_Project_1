function Three_dimensional_plot = marker_graph(vicon_and_delsys_data,txt) 
%the input should be the specific marker outputted from the marker of interest function
  [marker_of_interest, name_of_marker] = extract_marker_of_interest(vicon_and_delsys_data,txt); 
  time_windows = extract_time_windows(marker_of_interest);
  %if columns are incomplete, call the time windows in marker of interest
 
  X= marker_of_interest(:,1);%select first column 
  Y= marker_of_interest(:,2);%second column 
  Z= marker_of_interest(:,3);%third column 
 
  three_dimensional_plot=plot3(X,Y,Z, '*') 
  xlabel('X Data (mm)')
  ylabel('Y Data (mm)')
  zlabel('Z Data (mm)')
  
  title('Vicon System: 3D Visualization of', name_of_marker)  
  % title specific to whichever marker is being
  
end

