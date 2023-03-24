# Group_Project_1
<iframe src="https://docs.google.com/document/d/e/2PACX-1vQOtV8VLusCPOMN7dLhsYnmY91HE9IwB-VPb-xcpM5pbHWaTZWEtk_vYTQDS-zl-LiI-8coXY9DMFS3/pub?embedded=true" width="100%" height="600"></iframe>

(see google doc above for full project description, table of functions, and visual representations of experimental set up) 

Parkinson's Disease (PD) is a neurodegenerative disease that affects movement, often causing symptoms such as tremors, stiffness, and difficulty with balance and walking. Among the most distressing symptoms of Parkinson's disease is freezing of gait (FOG), which occurs when a person suddenly loses the ability to initiate or continue walking.
FootStep, Natalie’s student venture from Brown’s Nelson Center for Entrepreneurship, seeks to mitigate FOG episodes by creating a wearable device that deploys sensory cues. By providing external cues, people with Parkinson's Disease can focus their attention on the cue, which can help to override the dysfunctional neural circuits that lead to FOG.
FootStep is conducting clinical research to determine the effectiveness of sensory cues, such as lasers and auditory cues, in mitigating freezing of gait episodes. Data is collected via the Vicon camera system, which interfaces with 39 markers placed in distinct locations on the participant’s body (see image). The high-speed camera system captures 100 frames per second, making the excel sheet generated from each trial lengthy and not user friendly. 
Matlab enables us to streamline data analysis by parsing through entries and isolating the activity of single markers. This is an essential first step for quantifying variables related to gait (IE: steps walked, joint angle position, stride length, kinematics). 
In this project, we employ Matlab to…
Extract relevant features from data collected using motion capture systems and wearable sensors. 
Account for gaps in the data. While the video capture is robust, there are moments in which marker data is not captured, and coordinate data is lost. Our code enables us to detect how many gaps exist, and which time window(s) they occur. From a research perspective, identifying these gaps enables us to make real-time adjustments to the physical markers placed on the participant. 
Generate 2-D, 3-D, and 4-D plots that show changes in x,y, and z coordinates over time (frames captured). These plots provide insight into the number of steps taken and the amplitude of each step. In future projects, we will extrapolate this data to find joint angles, stride length, and other relevant biomechanical and kinematic metrics that will be useful to the clinical research project. 



