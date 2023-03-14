function four_dimensional_plot = fourd_graph(vicon_and_delsys_data) 
%the input should be the specific marker outputted from the marker of interest function
  [marker_of_interest, name_of_marker] = extract_marker_of_interest(vicon_and_delsys_data); 

  %if columns are incomplete, call the time windows in marker of interest
  
  X= marker_of_interest(:,1);%select first column 
  Y= marker_of_interest(:,2);%second column 
  Z= marker_of_interest(:,3);%third column 
  W_ex = 1:size(Y,1);
  W = W_ex*0.01;
 
  three_dimensional_plot=scatter3(X,Y,Z,[],W, 'filled');
  cb = colorbar; % create and label the colorbar
  cb.Label.String = 'Time (seconds)';
  xlabel('X Data (mm)')
  ylabel('Y Data (mm)')
  zlabel('Z Data (mm)')
  
  title('Vicon System: 4D Visualization of', name_of_marker)  
  % title specific to whichever marker is called 
  
end



% Create 4D scatter plot