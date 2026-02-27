function exampleHelperLoadSawyerMesh()
    %exampleHelperLoadSawyerMesh load sawyer robot mesh for visualization in Simscape Multibody
    %
    %   Set robot's mesh filepaths on the Simscape Multibody visualization blocks.

    %   Copyright 2017-2020 The MathWorks, Inc.
    
    % Define path to Sawyer meshes (updated in 2020)
    sawyerMeshPath = fullfile(matlabroot, 'toolbox', 'robotics', 'robotmanip', ...
        'exampleRobots','sawyer_description','meshes','sawyer_pv');
    
    sawyerHeadHandle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/head/Visual';
    set_param(sawyerHeadHandle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'head.STL')) ;
    
    sawyerPedestalHandle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/pedestal/Visual';
    set_param(sawyerPedestalHandle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'pedestal.STL')) ;
    
    sawyerBaseHandle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/right_arm_base_link/Visual';
    set_param(sawyerBaseHandle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'base.STL')) ;
    
    sawyerL0Handle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/right_l0/Visual';
    set_param(sawyerL0Handle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'l0.STL')) ;
    
    sawyerL1Handle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/right_l1/Visual';
    set_param(sawyerL1Handle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'l1.STL')) ;
    
    sawyerL2Handle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/right_l2/Visual';
    set_param(sawyerL2Handle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'l2.STL')) ;
    
    sawyerL3Handle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/right_l3/Visual';
    set_param(sawyerL3Handle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'l3.STL')) ;
    
    sawyerL4Handle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/right_l4/Visual';
    set_param(sawyerL4Handle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'l4.STL')) ;
    
    sawyerL5Handle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/right_l5/Visual';
    set_param(sawyerL5Handle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'l5.STL')) ;
    
    sawyerL6Handle = 'robotSafeTrajectoryTracking/Simscape Model with Simple Contact Mechanics/right_l6/Visual';
    set_param(sawyerL6Handle, 'ExtGeomFileName', fullfile(sawyerMeshPath, 'l6.STL')) ;
end