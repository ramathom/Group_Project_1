function time_windows = extract_time_windows(marker_of_interest)

num_of_frames = size(marker_of_interest);
time_windows = [];

%checks that the coordinates at each frame are complete (contains numbers
%at x, y, and z). If true, then that frame is added to time_windows. All
%incomplete coordinates (contain NaN at X,Y,and/or Z) are excluded.
for frame = 1:num_of_frames(1)
    if ~isnan(marker_of_interest(frame,1)) && ~isnan(marker_of_interest(frame,2)) && ~isnan(marker_of_interest(frame,3))
        time_windows = [time_windows frame];
    end
end
end