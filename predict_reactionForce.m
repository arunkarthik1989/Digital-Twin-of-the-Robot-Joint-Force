% predict_reactionForce.m
function [reaction_force_predicted] = predict_reactionForce(new_data)
    % Ensure models are loaded in the base workspace
    model_reactionForce = evalin('base', 'reactionForcemodel');
    
    % Convert new_data to a Python list and reshape to 2D array
    new_data_py = py.numpy.array(new_data).reshape(py.int(1), py.int(length(new_data)));
    
    % Predict using the loaded models
    reaction_force_predicted = double(model_reactionForce.predict(new_data_py));
end

