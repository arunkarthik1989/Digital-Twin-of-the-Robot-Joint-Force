% this program is a demonstration for reading and writing values from MySQL
% Workbench
% Specify the location of the MySQL JDBC driver
%if your laptop doesnt have Java installed pls do the same from Google
% Initialize persistent variables to store previous values
% Initialize persistent variables to store previous values
prev_torque_input1 = 0;
prev_torque_input2 = 0;
prev_torque_input3 = 0;
prev_torque_input4 = 0;
prev_torque_input5 = 0;
prev_torque_input6 = 0;
prev_torque_input7 = 0;
rev_endeffectorPos = 0;
prev_endeffectorVel = 0;
prev_objectPos = 0;
prev_reaction_force = 0;
prev_endeffectorPos = 0

driverLocation = 'C:\mysql-connector-j-9.0.0\mysql-connector-j-9.0.0.jar';  % Update with your actual path

% Add the MySQL JDBC driver to MATLAB's Java class path
javaaddpath(driverLocation);

% Define the connection parameters
datasource = '';  % Leave empty for DSN-less connection
username = 'root';
password = '1234';
url = 'jdbc:mysql://localhost:3306/matlab_db';  % JDBC URL for MySQL

% Establish the connection directly with all parameters
conn = database(datasource, username, password, ...
    'Vendor', 'MySQL', ...
    'Server', 'localhost', ...
    'PortNumber', 3306, ...
    'JDBCDriver', 'com.mysql.cj.jdbc.Driver', ...
    'URL', url, ...
    'JDBCDriverLocation', driverLocation);

% Check if the connection is successful
if isopen(conn)
    disp('Connection successful!');
else
    disp('Failed to connect to MySQL.');
    disp(conn.Message);  % Display any error message
end


open_system('robotSafeTrajectoryTracking.slx');

while true
    % Example variables - replace these with actual sensor or simulation data
    % Generate a custom timestamp
    customTimestamp = datestr(now, 'yyyy-mm-dd HH:MM:SS'); % Example: '2025-01-05 15:30:45'
    
    % Compare current values with previous values
    if torque_input1_sm ~= prev_torque_input1 || ...
       torque_input2_sm ~= prev_torque_input2 || ...
       torque_input3_sm ~= prev_torque_input3 || ...
       torque_input4_sm ~= prev_torque_input4 || ...
       torque_input5_sm ~= prev_torque_input5 || ...
       torque_input6_sm ~= prev_torque_input6 || ...
       torque_input7_sm ~= prev_torque_input7 || ...
       endeffectorPos_sm ~= prev_endeffectorPos || ...
       endeffectorVel_sm ~= prev_endeffectorVel || ...
       objectPos_sm ~= prev_objectPos || ...
       reactionForce_sm ~= prev_reaction_force
        % If any value has changed, update the database
        
        % Construct the query
        query = sprintf("INSERT INTO matlab_db.urdf_robot (torque_input1, torque_input2, torque_input3, torque_input4, torque_input5, torque_input6, torque_input7, endeffectorPos, endeffectorVel, objectPos, reaction_force, timestamp) VALUES (%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, '%s')", ...
            torque_input1_sm, torque_input2_sm, torque_input3_sm, torque_input4_sm, torque_input5_sm, torque_input6_sm, torque_input7_sm, endeffectorPos_sm, endeffectorVel_sm, objectPos_sm, reaction_force_sm, customTimestamp);
        
        % Execute the query
        exec(conn, query);
        disp('Data with custom timestamp inserted successfully');
        
        % Update the persistent variables
        prev_torque_input1 = torque_input1_sm;
        prev_torque_input2 = torque_input2_sm;
        prev_torque_input3 = torque_input3_sm;
        prev_torque_input4 = torque_input4_sm;
        prev_torque_input5 = torque_input5_sm;
        prev_torque_input6 = torque_input6_sm;
        prev_torque_input7 = torque_input7_sm;
        prev_endeffectorPos = endeffectorPos_sm;
        prev_endeffectorVel = endeffectorVel_sm;
        prev_objectPos = objectPos_sm;
        prev_reaction_force = reactionForce_sm;
    else
        % If no changes detected, do not write to the database
        disp('No changes detected in variables. Data not written to MySQL.');
    end
    % Pause to prevent overloading the system (adjust as needed)
    pause(1); % Pauses for 1 second before the next iteration
end
