function time_windows = extract_time_windows(marker_of_interest)

num_of_frames = size(marker_of_interest);
time_windows = [];

%checks that the coordinates at each frame are complete (doesn't contain NaN
%at x, y, or z). If complete, then that frame is added to time_windows.
for frame = 1:num_of_frames(1)
    if ~isnan(marker_of_interest(frame,1)) && ~isnan(marker_of_interest(frame,2)) && ~isnan(marker_of_interest(frame,3))
        time_windows = [time_windows frame]; %updating matrix to include each subsequent frame that's NaN 

    end
end
end