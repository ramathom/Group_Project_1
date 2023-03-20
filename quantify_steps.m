function num_of_steps = quantify_steps(vicon_and_delsys_data)

RANK = auto_extract_marker_of_interest(vicon_and_delsys_data,"RANK");
LANK = auto_extract_marker_of_interest(vicon_and_delsys_data,"LANK");
RANK_time_windows = extract_time_windows(RANK);
LANK_time_windows = extract_time_windows(LANK);

right_foot_steps = 0;
left_foot_steps = 0;

%quantifies number of steps based on maxima.
%Maxima = points at which foot is at highest elevation (z point).
%The right and left ankles (RANK and LANK) are used to approximate foot
%position.

%quantifies right steps.
for index = 101:100:length(RANK_time_windows)-100

    current_frame = RANK_time_windows(index);
    next_frame = RANK_time_windows(index+100);
    previous_frame = RANK_time_windows(index-100);

    if RANK_time_windows(index+100) == RANK_time_windows(index) + 100 && RANK_time_windows(index-100) == RANK_time_windows(index) - 100 %only considering every 100 frames (every 1 second)
        if RANK(current_frame,3) > RANK(next_frame,3) && RANK(current_frame,3) > RANK(previous_frame,3) %if the current frame z coordinate is greater than the next frame, it's likely a maxima.
            RANK(current_frame,3)
            right_foot_steps = right_foot_steps + 1;
        end
    end
end

%quantifies left steps.
for index = 101:100:length(LANK_time_windows)-100

    current_frame = LANK_time_windows(index);
    next_frame = LANK_time_windows(index+100);
    previous_frame = LANK_time_windows(index-100);

    if LANK_time_windows(index+100) == LANK_time_windows(index) + 100 && LANK_time_windows(index-100) == LANK_time_windows(index) - 100
        if LANK(current_frame) > LANK(next_frame) && LANK(current_frame,3) > LANK(previous_frame,3)
            LANK(current_frame,3)
            left_foot_steps = left_foot_steps + 1;
        end
    else
        continue
    end
end

%num_of_steps may overestimate actual # of steps because z coordinates
%sometimes "waver" on the data-sheet. Cross-ref with video to confirm accurate # of steps.
num_of_steps = right_foot_steps + left_foot_steps;

steps_string = strcat("The total number of steps in this trial is ",num2str(num_of_steps));

disp(steps_string)

end