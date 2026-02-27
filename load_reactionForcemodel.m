function load_reactionForce_model()
    % Load the model using Python's pickle module
    model = py.pickle.load(py.open('xgboost_blast_furnace_model.pkl', 'rb'));
    
    % Save the loaded model into the MATLAB base workspace
    assignin('base', 'reactionForcemodel', model);
end